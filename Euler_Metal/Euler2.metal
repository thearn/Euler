#include <metal_stdlib>
using namespace metal;

kernel void sumOfEvenFibonacciValues(
    const constant uint & limit [[buffer(0)]],
    device uint & sum [[buffer(1)]]
) {
    uint2 values = uint2(1, 1);
    do {
        auto newValue = values[0] + values[1];
        sum += (newValue % 2 == 0) * newValue;
        values[0] = values[1];
        values[1] = newValue;
    } while (values[1] < limit);
}