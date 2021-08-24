import Foundation

let nm = (readLine()!.split(separator: " ")).map{ Int($0)! }

let n = nm[0]
let m = nm[1]
var min = nm.min()!

var rectangle = Array(repeating: Array(repeating: 0, count: m), count: n)

for i in 0..<n {
    rectangle[i] = readLine()!.map{Int(String($0))!}
}

var result = 1

for i in 0..<n {
    for j in 0..<m {
        for k in 1..<min {
            if i + k < n && j + k < m
                && rectangle[i+k][j] == rectangle[i][j]
                && rectangle[i+k][j+k] == rectangle[i][j]
                && rectangle[i][j+k] == rectangle[i][j] {
                result = max(result, k+1)
            }
        }
    }
}

print(result*result)
