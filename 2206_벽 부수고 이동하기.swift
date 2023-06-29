import Foundation

// 2206_벽 부수고 이동하기

// 문제
// (1,1)에서 (n,m)으로 이동하는데 벽을 하나 부술 수 있다.
// 최소값 구하기
// 불가능하면 -1

// 풀이
// 큐에 x, y, 부쉈는가를 저장하려했는데 방문처리가 애매해지네
// visited - Set -> 메모리 초과
// => 3차원 배열로 관리

let dx = [0, 0, -1, 1]
let dy = [-1, 1, 0, 0]

let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, m) = (nm[0], nm[1])
var map = [[Bool]](repeating: [Bool](repeating: false, count: m), count: n)
for i in 0..<n {
    map[i] = readLine()!.map { String($0) == "0" }
}

struct Point: Hashable {
    let x: Int
    let y: Int
    let isBreak: Bool
    let distance: Int
}

print(bfs())

func bfs() -> Int {
    if n == 1 && m == 1 {
        return 1
    }
    var queue: [Point] = [Point(x: 0, y: 0, isBreak: false, distance: 0)]
    var qIdx = 0
    var visited = [[[Bool]]](repeating: [[Bool]](repeating: [false, false], count: m), count: n)
    visited[0][0][1] = true
    while qIdx < queue.count {
        let node = queue[qIdx]
        qIdx += 1
        
        for i in 0..<4 {
            let px = node.x + dx[i]
            let py = node.y + dy[i]
            if 0..<n ~= px && 0..<m ~= py {
                if px == n-1 && py == m-1 { return node.distance + 2 }
                
                let isBreak = node.isBreak ? true : (!map[px][py] ? true : false)
                let p = Point(x: px, y: py, isBreak: isBreak, distance: node.distance + 1)
                if !visited[px][py][isBreak ? 0 : 1] && (map[px][py] || !map[px][py] && !node.isBreak) {
                    visited[px][py][isBreak ? 0 : 1] = true
                    queue.append(p)
                }
            }
        }
    }
    return -1
}
