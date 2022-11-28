import Foundation

let n = Int(readLine()!)!
let m = Int(readLine()!)!
let maxx = Int(1e9)
var graph = [[Int]](repeating: [Int](repeating: maxx, count: n), count: n)
for _ in 0..<m {
    let bus = readLine()!.split(separator: " ").map { Int(String($0))! }
    graph[bus[0]-1][bus[1]-1] = min(graph[bus[0]-1][bus[1]-1], bus[2])
}
for i in 0..<n { graph[i][i] = 0 }
let se = readLine()!.split(separator: " ").map { Int(String($0))! }
let start = se[0] - 1, end = se[1] - 1
var visit = [Bool](repeating: false, count: n)
var distance = graph[start]
visit[start] = true

for _ in 0..<n {
    let idx = minIdx()
    for i in 0..<n {
        if !visit[i] && distance[i] > distance[idx] + graph[idx][i] {
            distance[i] = distance[idx] + graph[idx][i]
        }
    }
    visit[idx] = true
}

print(distance[end])

func minIdx() -> Int {
    var idx = 0
    var minn = maxx
    for i in 0..<n {
        if !visit[i] && minn > distance[i] {
            minn = distance[i]
            idx = i
        }
    }
    return idx
}
