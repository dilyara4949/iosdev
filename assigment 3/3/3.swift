// convert celcius to kelvin and fahrenheit
func fromCelsius(_ c: Double) -> (f: Double, k: Double) {
    let f = (c * 9/5) + 32
    let k = c + 273.15
    return (f, k)
}

// convert fahrenheit to kelvin and celcius
func fromFahrenheit(_ f: Double) -> (c: Double, k: Double) {
    let c = (f - 32) * 5/9
    let k = c + 273.15
    return (c, k)
}

// convert kelvin to celcius and fahrenheit
func fromKelvin(_ k: Double) -> (c: Double, f: Double) {
    let c = k - 273.15
    let f = (c * 9/5) + 32
    return (c, f)
}

print("Enter a temperature value:")
if let input = readLine(), let temperature = Double(input) {
    print("Enter the unit C, K or F:")
    if let unit = readLine()?.uppercased() {
        switch unit {
        case "C":
            let (f, k) = fromCelsius(temperature)
            print("\(temperature)°C --> \(f)°F and \(k) K")
        case "F":
            let (c, k) = fromFahrenheit(temperature)
            print("\(temperature)°F --> \(c)°C and \(k) K")
        case "K":
            let (c, f) = fromKelvin(temperature)
            print("\(temperature) K --> \(c)°C and \(f)°F")
        default:
            print("Invalid unit")
        }
    }
} else {
    print("Invalid temperature input")
}