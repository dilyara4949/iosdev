
// 1.1
var fruits: [String] = ["apple", "banana", "kiwi", "apelsine", "lemon"]
print(fruits[2])

// 1.2
var nums: Set = [1, 2, 3, 5, 7]
nums.insert(8)
print(nums)

// 1.3
var dict = ["swift": 2007, "go": 2000, "python": 2001]
print(dict["swift"]!)

// 1.4
var colors = ["red", "blue", "yellow", "green"]
colors[1] = "black"
print(colors)

// 2.1
var x: Set = [1, 2, 3, 4]
var y: Set = [3, 4, 5, 6]
print(x.intersection(y))

// 2.2
var stud = ["bob": 5, "mike": 4, "katya": 3]
stud["bob"] = 2
print(stud)

// 2.3
var ar1 = ["apple", "banana"]
var ar2 = ["cherry", "date"]
var c = ar1+ar2
print(c)

// 3.1
var countrs = ["kazakhstan":19, "korea":40, "france":50]
countrs["russia"] = 100
print(countrs)

// 3.2
var anim1: Set = ["cat", "dog"]
var anim2: Set = ["dog", "mouse"]
var anim = anim1.union(anim2)
anim.subtract(anim2)
print(anim)

// 3.3
var grades = [
    "bob": [1, 2, 3, 4, 5],
    "mike": [3, 4, 5]
]
print(grades["mike"]![1])