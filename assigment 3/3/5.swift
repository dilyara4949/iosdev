import Cocoa

func countWordFrequencies(in sentence: String) -> [String: Int] {
    var wordFreq: [String: Int] = [:]
    
    let words = sentence.lowercased().components(separatedBy: CharacterSet.whitespacesAndNewlines)
    
    for word in words {
        if !word.isEmpty {
            wordFreq[word, default: 0] += 1
        }
    }
    return wordFreq
}

print("Enter a sentence:")
if let sentence = readLine() {
    let freq = countWordFrequencies(in: sentence)
    
    print("\nWord frequencies:")
    for (word, count) in freq {
        print("'\(word)' -- \(count)")
    }
} else {
    print("Invalid input")
}