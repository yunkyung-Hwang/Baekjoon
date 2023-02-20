import Foundation

// 각 컴퓨터를 연결하는 비용이 주어짐
// 모두를 연결할 수 있는 최소 비용
// MST - 최소 신장 트리

let n = Int(readLine()!)!
let m = Int(readLine()!)!

var graph = [[Int]](repeating: [Int](repeating: 0, count: 3), count: m)
var parent = Array(0...n)
var result = 0

for i in 0..<m {
    graph[i] = readLine()!.split(separator: " ").map { Int($0)! }
}

graph.sort { $0[2] < $1[2] }

for i in 0..<m {
    if findParent(graph[i][0]) != findParent(graph[i][1]) {
        result += graph[i][2]
        union(graph[i][0], graph[i][1])
    }
}

print(result)

func findParent(_ element: Int) -> Int {
    if parent[element] != element {
        return findParent(parent[element])
    } else {
        return element
    }
}

func union(_ n1: Int, _ n2: Int) {
    let p1 = findParent(n1)
    let p2 = findParent(n2)
    if p1 < p2 {
        parent[p2] = p1
    } else {
        parent[p1] = p2
    }
}
