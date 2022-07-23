import Foundation

let nm = readLine()!.components(separatedBy: " ")
let n = Int(nm[0])!
let m = Int(nm[1])!
let dx = [-1, 0, 1, 0]
let dy = [0, 1, 0, -1]
var board = [[Int]](repeating: [Int](repeating: 0, count: m), count: n)
var visited = [[Int]](repeating: [Int](repeating: -1, count: m), count: n)
var isCycle = false
var result = 0

func dfs(x: Int, y: Int) -> Int {
    if x < 0 || y < 0 || x >= n || y >= m || board[x][y] == -1 || isCycle { return 0 }
    
    var cal = -1
    if visited[x][y] == -1 {
        visited[x][y] = 0
        for i in 0..<4 {
            let r = dfs(x: x + board[x][y] * dx[i], y: y + board[x][y] * dy[i]) + 1
            if cal < r { cal = r }
        }
        visited[x][y] = cal
        return cal
    } else if visited[x][y] == 0 {
        isCycle = true
        return 0
    } else {
        return visited[x][y]
    }
}

// board 입력
for i in 0..<n {
    // 숫자가 아닌 값을 int화 할 경우 오류남 따라서 옵셔널처리
    // map은 O(N)의 시간복잡도를 가짐
    // 시간을 줄이기 위해 readLine에서 바로 매핑
    // 20ms -> 12ms
    let s = readLine()!.map{Int(String($0)) ?? -1}
    for j in 0..<m {
        board[i][j] = s[j]
    }
}

result = dfs(x: 0, y: 0)
result = isCycle ? -1 : result
print(result)
