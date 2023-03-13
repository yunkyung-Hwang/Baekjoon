import Foundation

// 10159 저울

// 문제
// 무게가 다른 N개의 물건에 1~N 번호가 매겨져있다.
// 어느것이 더 무거운지 기록한 측정표가 있다.
// 측정표를 보고 어느 것이 더 무거운지 알아볼 수 있기도하고 없기도 하다
// 비교 결과를 알 수 없는 물건의 개수 출력

// 풀이 1) 트리 (X)
// 트리 만들어서 더 무거운 놈이 더 가벼운 놈의 자식노드로 추가
// 각 노드의 방문 불가 노드 개수 = N - (노드의 모든 부모 노드 수 + 노드의 모든 자식 노드 수)
// 잘 못 생각한 점: 여러개의 부모를 가질 수 있음. 트리가 아니고 그래프 구조임

// 풀이 2) 플로이드 와샬
// 방향성 있는 그래프
// 최단거리 아니고 갈 수 있는지만 확인하면 됨
// 단, 탐색 방향이 L->L이나 H->H은 되지만 L->H이나 H->L은 안됨 (Light, Heavy)
// 부모쪽으로 쭉 이동하거나 자식 쪽으로 쭉 이동할 수는 있지만 부모의 자식으로 이동은 안됨

let n = Int(readLine()!)!
let m = Int(readLine()!)!

var graph = [[String]](repeating: [String](repeating: "-", count: n), count: n)
for _ in 0..<m {
    let w = readLine()!.split(separator: " ").map { Int(String($0))! }
    graph[w[0]-1][w[1]-1] = "H"
    graph[w[1]-1][w[0]-1] = "L"
}

for k in 0..<n {
    for i in 0..<n {
        for j in 0..<n {
            if graph[i][k] != "-" && graph[i][k] == graph[k][j] {
                graph[i][j] = graph[i][k]
            }
        }
    }
}

for i in 0..<n {
    var result = 0
    for j in 0..<n { if graph[i][j] == "-" { result += 1 }}
    print(result - 1)
}
