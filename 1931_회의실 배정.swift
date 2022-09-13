import Foundation

let n = Int(readLine()!)!
var meeting = [[Int]](repeating: [Int](repeating: 0, count: 2), count: n)
var result = 0

for i in 0..<n {
    meeting[i] = readLine()!.split(separator: " ").map { Int($0)! }
}

meeting.sort { a, b in
    return a[1] == b[1] ? a[0] < b[0] : a[1] < b[1]
}

var end = -1
for meet in meeting {
    if meet[0] >= end {
        end = meet[1]
        result += 1
    }
}

print(result)
