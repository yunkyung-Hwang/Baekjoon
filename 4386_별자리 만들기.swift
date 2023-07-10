import Foundation

// 4386_별자리 만들기

// 문제
// 널브러져 있는 n개의 별들을 이어서 별자리를 하나 만들것
// 모든 별들은 직간접적으로 이어져있어야한다.
// 별자리를 만드는 최소 비용 구하기

// 풀이
// 최소스패닝트리 MST - 크루스칼/프림
// 별 개수 100개 이하니까 간선 다 만들어서 크루스칼

let n = Int(readLine()!)!
typealias Point = (x: Double, y: Double)
var stars = [Point](repeating: (0, 0), count: n)
for i in 0..<n {
    let input = readLine()!.split(separator: " ").map { Double(String($0))! }
    stars[i] = (input[0], input[1])
}
var parent = Array(0...n)

typealias Line = (distance: Double, n1: Int, n2: Int)
var lines = [Line]()
for i in 0..<n-1 {
    for j in i+1..<n {
        lines.append((getDistance(stars[i], stars[j]), i, j))
    }
}
lines.sort(by: { $0.distance < $1.distance })

var result: Double = 0
for line in lines {
    if findParent(line.n1) != findParent(line.n2) {
        union(line.n1, line.n2)
        result += line.distance
    }
}
print(String(format: "%.2f", result))

func getDistance(_ from: Point, _ to: Point) -> Double {
    return sqrt(pow(from.x - to.x, 2) + pow(from.y - to.y, 2))
}

func findParent(_ e: Int) -> Int {
    if parent[e] != e {
        parent[e] = findParent(parent[e])
    }
    return parent[e]
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
