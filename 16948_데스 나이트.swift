import Foundation

let n = Int(readLine()!)!
let r = readLine()!.split(separator: " ").map{ Int($0)! }
var start = [r[0], r[1]]
let end = [r[2], r[3]]
let d = [
    [-2, -1],
    [-2, 1],
    [0, -2],
    [0, 2],
    [2, -1],
    [2, 1]
]
var minimum = Int.max
var result = 0

while true {
    var idx = -1
    for i in 0..<d.count {
        let tmp = [start[0] + d[i][0], start[1] + d[i][1]]
        if minimum > abs(end[0] - tmp[0]) + abs(end[1] - tmp[1]) {
            minimum = abs(end[0] - tmp[0]) + abs(end[1] - tmp[1])
            idx = i
        }
    }
    
    if idx == -1 {
        print(-1)
        exit(0)
    }
    
    start[0] += d[idx][0]
    start[1] += d[idx][1]
    result += 1
    
    if minimum == 0 { break }
}
print(result)
