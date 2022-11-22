import Foundation

/*
 [플로이드-와샬]
 - 모든 정점에서 모든 정점으로의 최단경로 (출발점이 따로 정해져있지 않은 경우!)
 - 거쳐가는 정점을 기준으로 알고리즘 수행 (경유하는 정점 기준)
 - "X에서 Y로 가는 최소비용" VS "X에서 노드n으로 가는 비용 + 노드n에서 Y로 가는 비용"
    ex) D[2, 3] = min(D[2, 3], D[2, 1] + D[1, 3])
 
 - 출발점이 정해져있는 경우는 다익스트라, 벨만-포드 알고리즘
    : 주어진 하나의 정점으로부터 다른 모든 정점들까지의 최단 경로
 */

let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = nm[0]
let m = nm[1]
var graph = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)

// input
for i in 0..<n {
    graph[i] = readLine()!.split(separator: " ").map { Int(String($0))! }
}

// calculate
for tmp in 0..<n { // 모든 정점들을 거쳐 가는 경우를 확인
    // 2차원 배열에 대하여
    for i in 0..<n {
        for j in 0..<n {
            // D[i][j]는 직접 가는 것(D[i][j])과 tmp를 거쳐 가는 것 중 작은 값
            graph[i][j] = min(graph[i][j], graph[i][tmp] + graph[tmp][j])
        }
    }
}

// output
for _ in 0..<m {
    let p = readLine()!.split(separator: " ").map { Int(String($0))! }
    print(graph[p[0]-1][p[1]-1] <= p[2] ? "Enjoy other party" : "Stay here")
}
