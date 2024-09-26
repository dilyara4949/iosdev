import Cocoa

func hasUniqueCharacters(_ text: String) -> Bool {
    var chars: Set<Character> = []

    for c in text {
        if chars.contains(c) {
            return false
        }
        chars.insert(c)
    }
    return true
}

print("'qwerty' has unique characters -- \(hasUniqueCharacters("qwerty"))")
print("'qweq' has unique characters -- \(hasUniqueCharacters("qweq"))")
print("'AaBb' has unique characters -- \(hasUniqueCharacters("AaBb"))")
