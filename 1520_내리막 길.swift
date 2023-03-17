import Foundation

// 1520 내리막 길

// 문제
// 제일 왼쪽 위에서 제일 오른쪽 아래로 이동
// 높이가 더 낮은 지점으로만 이동 가능
// 최단거리 아니어도 됨

// 풀이
// dfs + dp
// dp: 해당 좌표부터 종료 지점까지 갈 수 있는 경우의 수
// 방문 해제 처리 하지 말고 방문된 지점에 도달하면 이미 거기부터는 탐색이 끝났기때문에 해당 지점 dp 값 반환

// 시간복잡도
// 세로 M, 가로 N <= 500
// 단순 dfs: 4^(500*500)  // 시간초과
// dp: 500*500

let mn = readLine()!.split(separator: " ").map{ Int($0)! }
let m = mn[0]
let n = mn[1]
var board = [[Int]](repeating: [Int](repeating: 0, count: n), count: m)
var visit = [[Bool]](repeating: [Bool](repeating: false, count: n), count: m)
var dp = [[Int]](repeating: [Int](repeating: 0, count: n), count: m)

let dx = [-1, 0, 1, 0]
let dy = [0, -1, 0, 1]

for i in 0..<m {
    board[i] = readLine()!.split(separator: " ").map{ Int($0)! }
}

print(dfs(x: 0, y: 0))

func dfs(x: Int, y: Int) -> Int {
    if x == m - 1 && y == n - 1 { return 1 }
    else if visit[x][y] {
        return dp[x][y]
    }
    
    visit[x][y] = true
    for i in 0..<4 {
        let px = x + dx[i]
        let py = y + dy[i]
        if px >= 0 && px < m && py >= 0 && py < n
            && board[px][py] < board[x][y] {
            dp[x][y] += dfs(x: x + dx[i], y: y + dy[i])
        }
    }
    return dp[x][y]
}
