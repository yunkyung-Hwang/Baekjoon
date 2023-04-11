import Foundation

// 1774_우주신과의 교감

// 문제
// 황선자씨와 우주신들 & 우주신들끼리 연결되어있다.
// 황선자씨는 우주신들과 모두 연결 되어야하며 최대한 짧은 거리로 연결되길 바란다.
// 우주신을 거쳐서 다른 우주신에 연결되어도 된다.
// 이미 만들어진 통로 외에 더 만들어야 할 최소의 통로 길이를 출력하라

// 풀이) 최소신장트리
// 최단거리는 하나로부터 다른 하나까지 최단거리를 구하는거고
// 이 문제는 집합에서 뻗어나가는 거

// 크루스칼 알고리즘
// N <= 1000이니까 각 노드끼리 거리 계산해서 저장
// 최단거리 순으로 정렬

// 시간복잡도: O(n^2)

let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, m) = (nm[0], nm[1])
typealias Point = (x: Int, y: Int)
typealias Line = (n1: Int, n2: Int, distance: Double)
var nodes = [Point](repeating: (0, 0), count: n+1)    // 황선자와 외계인의 좌표
var lines = [Line]()
var parent = Array(0...n)

for i in 1...n {
    let node = readLine()!.split(separator: " ").map { Int(String($0))! }
    nodes[i] = (node[0], node[1])
}

// O(n^2)
for i in 1..<n {
    for j in i+1...n {
        lines.append((i, j, getDistance(n1: nodes[i], n2: nodes[j])))
    }
}
lines.sort(by: { $0.distance < $1.distance })

for _ in 0..<m {
    let lines = readLine()!.split(separator: " ").map { Int(String($0))! }
    union(lines[0], lines[1])
}
print(parent)

var result: Double = 0
for line in lines {
    if findParent(line.n1) == findParent(line.n2) { continue }
    // 여기서 틀림 findParent와 parent로 접근은 다름
//    if parent[line.n1] == parent[line.n2] { continue }
    
    union(line.n1, line.n2)
    result += getDistance(n1: nodes[line.n1], n2: nodes[line.n2])
}

print(String(format: "%.2lf", result))

func getDistance(n1: Point, n2: Point) -> Double {
    return sqrt(pow(Double(n1.x - n2.x), 2) + pow(Double(n1.y - n2.y), 2))
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

func findParent(_ element: Int) -> Int {
    if parent[element] != element {
        parent[element] = findParent(parent[element])
    }
    return parent[element]
}
