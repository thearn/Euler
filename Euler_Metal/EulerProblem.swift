import Metal

public class EulerProblem {
    init(functionName: String,
        var limit: Int,
        threadgroupsPerGrid: (threadExecutionWidth: Int) -> Int,
        threadsPerGroup: (threadExecutionWidth: Int) -> Int
    ) {
        let device = MTLCreateSystemDefaultDevice()!,
            commandQueue = device.newCommandQueue(),
            pipelineState = try! device.newComputePipelineStateWithFunction(
                device.newDefaultLibrary()!.newFunctionWithName(functionName)!
            ),
            sumBuffer = device.newBufferWithLength(4, options: .CPUCacheModeDefaultCache)

        compute = {
            let commandBuffer = commandQueue.commandBuffer(),
                commandEncoder = commandBuffer.computeCommandEncoder()
            
            commandEncoder.setComputePipelineState(pipelineState)
            commandEncoder.setBytes(&limit, length: 4, atIndex: 0)
            commandEncoder.setBuffer(sumBuffer, offset: 0, atIndex: 1)
            commandEncoder.dispatchThreadgroups(
                MTLSize(
                    width: threadgroupsPerGrid(threadExecutionWidth: pipelineState.threadExecutionWidth),
                    height: 1, depth: 1
                ),
                threadsPerThreadgroup: MTLSize(
                    width: threadsPerGroup(threadExecutionWidth: pipelineState.threadExecutionWidth),
                    height: 1, depth: 1
                )
            )
            commandEncoder.endEncoding()
            
            commandBuffer.commit()
            commandBuffer.waitUntilCompleted()
            return UnsafeMutablePointer<Int>(sumBuffer.contents())[0]
        }
    }

    public let compute: () -> Int
}