import Foundation

let people = Int(readLine()!)!
var time = (readLine()!.split(separator: " ")).map{ Int($0)! }
time = time.sorted()
var result = 0

for i in 0..<people {
    result += time[i] * (people-i)
}

print(result)
