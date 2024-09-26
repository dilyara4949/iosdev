import Cocoa

func fibonacci(_ n: Int) -> [Int] {
    var fib: [Int] = []

    if n >= 1 {
        fib.append(0)
    }
    if n >= 2 {
        fib.append(1)
    }

    var i = 2
    while i < n {
        fib.append(fib[i-1]+fib[i-2])
        i+=1
    }
    return fib
}

print("first -1 fibbonacci sequence: \(fibonacci(-1))")
print("first 0 fibbonacci sequence: \(fibonacci(0))")
print("first 2 fibbonacci sequence: \(fibonacci(2))")
print("first 4 fibbonacci sequence: \(fibonacci(4))")
print("first 10 fibbonacci sequence: \(fibonacci(10))")
print("first 20 fibbonacci sequence: \(fibonacci(20))")
