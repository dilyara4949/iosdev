func isPrime(_ n: Int) -> Bool {
    var i = 2
    while i * i < n {
        if n % i == 0 {
            return false
        }
        i = i + 1
    }
    return true
}

print("7 is prime = \(isPrime(7))")
print("19 is prime = \(isPrime(19))")
print("113 is prime = \(isPrime(113))")
print("20 is prime = \(isPrime(20))")
