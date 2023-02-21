import Foundation

let ve = readLine()!.split(separator: " ").map { Int($0)! }
let v = ve[0], e = ve[1]
var graph = [[Int]](repeating: [Int](repeating: 0, count: 3), count: e)
var parent = Array(0...v)
var result = 0

for i in 0..<e {
    graph[i] = readLine()!.split(separator: " ").map { Int($0)! }
}

graph.sort { $0[2] < $1[2] }

for i in 0..<e {
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
