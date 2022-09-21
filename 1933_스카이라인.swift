import Foundation

let n = Int(readLine()!)!
var buildings = [[Int]](repeating: [Int](repeating: 0, count: 3), count: n)
var points = [[Int]](repeating: [Int](repeating: 0, count: 2), count: 2*n)
var result = ""

for i in 0..<n {
    buildings[i] = readLine()!.split(separator: " ").map { Int($0)! }
}

var idx = 0
for i in 0..<buildings.count {
    points[idx] = [buildings[i][0], 0]
    idx += 1
    points[idx] = [buildings[i][2], 0]
    idx += 1
}

points.sort{ $0[0] < $1[0] }

for j in 0..<buildings.count {
    for i in j..<points.count {
        if points[i][0] >= buildings[j][2] { break }
        if points[i][0] < buildings[j][0] { continue }
        points[i][1] = max(points[i][1], buildings[j][1])
    }
}

result += "\(points[0][0]) \(points[0][1])"
for i in 1..<points.count {
    if points[i][1] == points[i-1][1] { continue }
    result += " \(points[i][0]) \(points[i][1])"
}

print(result)
