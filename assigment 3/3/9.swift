import Cocoa

func add(_ a: Double, _ b: Double) -> Double {
    return a + b
}

func subtract(_ a: Double, _ b: Double) -> Double {
    return a - b
}

func multiply(_ a: Double, _ b: Double) -> Double {
    return a * b
}

func divide(_ a: Double, _ b: Double) -> Double? {
    return b == 0 ? nil : a / b
}



while true {
    print("Enter the first number: ", terminator: "")
    guard let firstInput = readLine(), let x = Double(firstInput) else {
        print("Invalid input")
        continue
    }
    
    print("Enter the second number: ", terminator: "")
    guard let secondInput = readLine(), let y = Double(secondInput) else {
        print("Invalid input")
        continue
    }
    
    print("Choose an operation (+, -, *, /) or type 'exit' to quit: ", terminator: "")
    guard let operation = readLine(), !operation.isEmpty else {
        print("Invalid operation")
        continue
    }
    
    if operation.lowercased() == "exit" {
        print("Exit")
        break
    }

    var result: Double?
    switch operation {
    case "+":
        result = add(x, y)
    case "-":
        result = subtract(x, y)
    case "*":
        result = multiply(x, y)
    case "/":
        if let divisionResult = divide(x, y) {
            result = divisionResult
        } else {
            print("Error: division by zero is not allowed.")
        }
    default:
        print("Invalid operation")
        continue
    }
    
    if let result = result {
        print("Result: \(result)")
    }
    
    print()
}