import Foundation

let n = Int(readLine()!)!
var p = readLine()!.split(separator: " ").map { Int($0)! }
var result = 0

p.sort()
for i in 0..<n {
    result += p[i] * (n-i)
}

print(result)
