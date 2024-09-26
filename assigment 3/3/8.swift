import Cocoa

func isPalindrome(_ text: String) -> Bool {
    let txt = text.lowercased().filter{$0.isLetter}
    return txt == String(txt.reversed())
}

print("qwerty is palindrome -- \(isPalindrome("qwerty"))")
print("qwerty is palindrome -- \(isPalindrome("qweeWq"))")
print("qwerty is palindrome -- \(isPalindrome("1234321"))")