import Foundation

let nmr = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = nmr[0]
let m = nmr[1]
let r = nmr[2]
let maxx = 101
var itemCnt = readLine()!.split(separator: " ").map { Int(String($0))! }
var graph = [[Int]](repeating: [Int](repeating: maxx, count: n), count: n)
var result = 0

for _ in 0..<r {
    let t = readLine()!.split(separator: " ").map { Int(String($0))! }
    graph[t[0]-1][t[1]-1] = t[2]
    graph[t[1]-1][t[0]-1] = t[2]
}

for tmp in 0..<n {
    for i in 0..<n {
        for j in 0..<n {
            graph[i][j] = min(graph[i][j], graph[i][tmp] + graph[tmp][j])
        }
    }
}

for i in 0..<n {
    var tmp = 0
    for j in 0..<n {
        if graph[i][j] <= m || i == j {
            tmp += itemCnt[j]
        }
    }
    result = max(result, tmp)
}
print(result)
