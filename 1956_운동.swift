import Foundation

let ve = readLine()!.split(separator: " ").map { Int(String($0))! }
let v = ve[0], e = ve[1]
let maxx = Int(1e9)
var graph = [[Int]](repeating: [Int](repeating: maxx, count: v), count: v)
for _ in 0..<e {
    let t = readLine()!.split(separator: " ").map { Int(String($0))! }
    graph[t[0]-1][t[1]-1] = t[2]
}

for tmp in 0..<v {
    for i in 0..<v {
        for j in 0..<v {
            // min 메서드보다 if문 비교가 결과적으로 4배 빠름
//            graph[i][j] = min(graph[i][j], graph[i][tmp] + graph[tmp][j])
            if graph[i][j] > graph[i][tmp] + graph[tmp][j] {
                graph[i][j] = graph[i][tmp] + graph[tmp][j]
            }
        }
    }
}

var result = Int.max
for i in 0..<v {
    // min 메서드보다 if문 비교가 결과적으로 4배 빠름
//    result = min(result, graph[i][i])
    if graph[i][i] < result {
        result = graph[i][i]
    }
}

print(result == maxx ? -1 : result)
