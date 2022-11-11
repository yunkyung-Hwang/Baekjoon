import Foundation

let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = nm[0]
let m = nm[1]
var area = [[Int]](repeating: [Int](repeating: 0, count: 1025), count: 1025)
for i in 1...n {
    let tmp = readLine()!.split(separator: " ").map { Int(String($0))! }
    for j in 1...m {
        area[i][j] = tmp[j-1] + area[i][j-1]
    }
}
let k = Int(readLine()!)!
var range = [[Int]](repeating: [Int](repeating: 0, count: 4), count: k)
for i in 0..<k {
    range[i] = readLine()!.split(separator: " ").map { Int(String($0))! }
}

for k in 0..<k {
    var result = 0
    for i in range[k][0]...range[k][2] {
        result += area[i][range[k][3]] - area[i][range[k][1]-1]
    }
    print(result)
}
