extends Node

# Functional programming utilities

func map(f: FuncRef, arr: Array) -> Array:
    var result = []
    for item in arr:
        result.push_back(f.call_func(item))
    return result

func filter(f: FuncRef, arr: Array) -> Array:
    var result = []
    for item in arr:
        if f.call_func(item):
            result.push_back(item)
    return result

func foldl(f: FuncRef, initial, arr: Array):
    var result = initial
    for item in arr:
        result = f.call_func(result, item)
    return result

func sum(numbers: Array) -> int:
    var total = 0
    for x in numbers:
        total += x
    return total
