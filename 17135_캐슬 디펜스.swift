import Foundation

// 17135 캐슬 디펜스
// 문제
// 격자판의 N번행의 바로 아래(N+1번행)의 모든 칸에는 성이 있다.
// 궁수 3명 배치
// 거리가 D이하인 적 중에서 가장 가까운 적을 공격. 여럿인 경우 가장 왼쪽을 공격
// 같은 적이 여러 궁수에게 공격받을 수 있고 공격이 끝난 후 적 이동
// 아래로 한 칸씩 이동 성에 닿으면 사라짐
// 궁수의 공격으로 제거할 수 있는 적의 최대 수

// 적 이동: 맨 아래 행부터 아래로 한 칸씩 이동
// 시간복잡도
// 궁수 배치(15C3 = 455) * 적 이동(15)

let nmd = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, m, d) = (nmd[0], nmd[1], nmd[2])
var board = [[Int]](repeating: [Int](repeating: 0, count: m), count: n)
for i in 0..<n {
    board[i] = readLine()!.split(separator: " ").map { Int(String($0))! }
}
var b = board
typealias Point = (x: Int, y: Int)
let dx = [0, 0, -1, 1]
let dy = [-1, 1, 0, 0]

var result = 0
// 궁수를 배치할 수 있는 모든 포지션
for archers in combination(Array(0..<m), 3) {
    var attackedEnemyCount = 0
    for _ in 0..<n {
        var attackedEnemy = Set<[Int]>()
        // 공격
        for archer in archers {
            if let enemy = attackNearestEnemy(archer: (n, archer)) {
                attackedEnemy.insert(enemy)
            }
        }
        attackedEnemy.forEach { board[$0[0]][$0[1]] = 0 }
        attackedEnemyCount += attackedEnemy.count
        // 적 이동
        moveEnemy()
    }
    result = max(result, attackedEnemyCount)
    board = b
}
print(result)

/// d 까지의 거리에서 적 탐색 및 공격
/// 공격 가능한 적을 모두 큐에 넣고 시작
func attackNearestEnemy(archer: Point) -> [Int]? {
    var queue: [(point: Point, distance: Int)] = [((archer.x-1, archer.y), 1)]
    var qIdx = 0
    var visited = [[Bool]](repeating: [Bool](repeating: false, count: m), count: n)
    visited[archer.x-1][archer.y] = true
    while qIdx < queue.count {
        let node = queue[qIdx]
        qIdx += 1
        if node.distance >= d { break }
        for i in 0..<4 {
            let px = node.point.x + dx[i]
            let py = node.point.y + dy[i]
            
            if 0..<n ~= px && 0..<m ~= py && !visited[px][py] {
                queue.append(((px, py), node.distance + 1))
                visited[px][py] = true
            }
        }
    }
    queue.sort(by: { ($0.distance, $0.point.y) < ($1.distance, $1.point.y)})
    for node in queue {
        if board[node.point.x][node.point.y] == 1 {
            return [node.point.x, node.point.y]
        }
    }
    return nil
}

func moveEnemy() {
    board.removeLast()
    board.insert([Int](repeating: 0, count: m), at: 0)
}

func combination<T: Comparable>(_ array: [T], _ n: Int) -> [[T]] {
    var result = [[T]]()
    if array.count < n { return result }
    func comb(_ index: Int, _ now: [T]) {
        if now.count == n {
            result.append(now)
            return
        }
        
        for i in index..<array.count {
            comb(i + 1, now + [array[i]])
        }
    }
    
    comb(0, [])
    
    return result
}
