import Foundation

// **문제**
// 기본적으로 소는 인접한 칸으로 이동할 수 있지만
// 길이 있는 경우에는 이동할 수 없음
// 만날 수 없는 소의 쌍의 수 구하기
// N: 목장 변의 길이 <= 100 / K: 소의 수 <= 100
// R: 방향 <= 100 * 100 * 4 (?)

// **풀이: BFS**
// 소마다 bfs를 돌린다
// 길인지 판단하는 함수를 만든다 getDir: 상하좌우 0123
// 상하좌우 방향 중 길이 아닌 경우에만 큐에 넣는다.
// 소를 만날때마다 개수를 세주고 총 소의 수 - 만난 소의 수 - 1(본인/소) 값을 결과에 더해준다
// 쌍이므로 나누기 2

// **시간복잡도**
// 소 마리수(k) * bfs

// **주의**
// 시작 노드 방문 처리 잊지말기
// 길을 어떻게 저장할 것인가 자료구조 생각 잘하기

// **총평**
// 길(방향) 처리가 귀찮았던 문제

let nkr = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, k, r) = (nkr[0], nkr[1], nkr[2])
var isCow = [[Bool]](repeating: [Bool](repeating: false, count: n+1), count: n+1)
var road = [[[Int]]](repeating: [[Int]](repeating: [Int](), count: n+1), count: n+1)
var cows = [[Int]]()
var result = 0

// 상하좌우 0123
let dx = [-1, 1, 0, 0]
let dy = [0, 0, -1, 1]

func getDir(_ s: [Int], _ e: [Int]) -> Int {
    switch (e[0] - s[0], e[1] - s[1]) {
    case (-1, 0):
        return 0
    case (1, 0):
        return 1
    case (0, -1):
        return 2
    case (0, 1):
        return 3
    default:
        return -1
    }
}

for _ in 0..<r {
    let r = readLine()!.split(separator: " ").map { Int(String($0))! }
    road[r[0]][r[1]].append(getDir([r[0], r[1]], [r[2], r[3]]))
    road[r[2]][r[3]].append(getDir([r[2], r[3]], [r[0], r[1]]))
}

for _ in 0..<k {
    let cow = readLine()!.split(separator: " ").map { Int(String($0))! }
    cows.append(cow)
    isCow[cow[0]][cow[1]] = true
}

for i in 0..<cows.count {
    var queue = [cows[i]]
    var cnt = 0
    var visit = [[Bool]](repeating: [Bool](repeating: false, count: n+1), count: n+1)
    
    while !queue.isEmpty {
        let node = queue.removeFirst()
        let x = node[0], y = node[1]
        visit[x][y] = true
        
        for i in 0..<4 {
            let px = x + dx[i]
            let py = y + dy[i]
            if 1...n ~= px && 1...n ~= py && !visit[px][py] && !road[x][y].contains(getDir([x, y], [px, py])) {
                queue.append([px, py])
                visit[px][py] = true
                if isCow[px][py] {
                    cnt += 1
                }
            }
        }
    }
    
    result += cows.count - cnt - 1
}

print(result / 2)
