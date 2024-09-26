import Cocoa

let scores = ["Bob":7.0, "Alex":10.0, "Martin":8.0, "Melmon":5.0]
var mx = 0.0
var mn = 10.0
var avg = 0.0

for (_, score) in scores {
    avg += score
    mx = max(mx, score)
    mn = min(mn, score)
}

avg /= Double(scores.count)

print("max score -- \(mx)")
print("min score -- \(mn)")
print("average score -- \(avg)")


for (name, score) in scores {
    let lvl = score >= avg ? "above" : "below"
    print("\(name)'s score = \(score), which is \(lvl) the average")
}