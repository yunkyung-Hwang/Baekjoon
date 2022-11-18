import Foundation

// 플로이드-와샬 알고리즘
// 정점 간의 최단 경로(가중치)를 구하는 알고리즘
// or 경로의 유무

let n = Int(readLine()!)!
let maxx = 101  // 충분히 큰 값
var graph = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
for i in 0..<n {
    graph[i] = readLine()!.split(separator: " ").map { Int($0)! == 0 ? maxx : Int($0)! }
}

for k in 0..<n {
    for i in 0..<n {
        for j in 0..<n {
            graph[i][j] = min(graph[i][j], graph[i][k] + graph[k][j])
        }
    }
}

for i in 0..<n {
    for j in 0..<n {
        print(graph[i][j] == maxx ? "0" : "1", terminator: " ")
    }
    print()
}
