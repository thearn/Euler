#include <metal_stdlib>
using namespace metal;

kernel void sumOfMultiplesOf3or5(
    const uint threadPositionInGrid [[thread_position_in_grid]],
    const constant uint & limit [[buffer(0)]],
    volatile device atomic_uint * sum [[buffer(1)]]
) {
    if (threadPositionInGrid < limit
        && (threadPositionInGrid % 3 == 0 || threadPositionInGrid % 5 == 0)
    ) atomic_fetch_add_explicit(sum, threadPositionInGrid, memory_order_relaxed);
}