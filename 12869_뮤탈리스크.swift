import Foundation

// 12869_뮤탈리스크

// 문제
// 수빈 - 뮤탈리스크 1개
// 강호 - SCV N개(3개 이하), 각각 체력 존재
// SCV는 뮤탈리스크를 공격할 수 없지만 뮤탈리스크는 한 번에 3개의 SCV를 공격
// SCV를 모두 없애기 위해 공격해야하는 최솟값
// 12 10 4
// 9 1 3
// 0 0 0
// 무조건적인 정렬이 아님

let n = Int(readLine()!)!
var scvs = readLine()!.split(separator: " ").map { Int(String($0))! }
let count = scvs.count
let attack = [9, 3, 1]

print(bfs())
func bfs() -> Int {
    var queue = [(node: scvs, c: 0)]
    var qIdx = 0
    var visited = Set<[Int]>()
    visited.insert(scvs)

    while qIdx < queue.count {
        let node = queue[qIdx]
        qIdx += 1

        for scv in permutation(node.node, count) {
            var n = scv
            for i in 0..<n.count { n[i] -= attack[i] }
            if visited.contains(n) { continue }
            queue.append((n, node.c + 1))
            visited.insert(n)
            if n.filter({ $0 > 0 }).count == 0 { return node.c + 1 }
        }
    }
    return 0
}

func permutation<T: Comparable>(_ array: [T], _ n: Int) -> [[T]] {
    var result = [[T]]()
    if array.count < n { return result }

    var visited = Array(repeating: false, count: array.count)

    func cycle(_ now: [T]) {
        if now.count == n {
            result.append(now)
            return
        }

        for i in 0..<array.count {
            if visited[i] {
                continue
            } else {
                visited[i] = true
                cycle(now + [array[i]])
                visited[i] = false
            }
        }
    }

    cycle([])

    return result
}
