import Foundation

var c = 1
while true {
    let nm = readLine()!.split(separator: " ").map { Int($0)! }
    if nm.count == 0 { break }
    let n = nm[0]
    let m = nm[1]
    var board = [[String]](repeating: [String](repeating: ".", count: m), count: n)
    var visit = [[Bool]](repeating: [Bool](repeating: false, count: m), count: n)
    let dx = [-1, 0, 1, 0]
    let dy = [0, 1, 0, -1]
    var result = Int.max
    var areaCnt = 0

    for i in 0..<n {
        let arr = readLine()!.map { String($0) }
        board[i] = Array(arr)
        visit[i] = Array(arr).map { $0 == "*" }
    }
    
    for i in 0..<n {
        for j in 0..<m {
            if board[i][j] == "." {
                areaCnt += 1
            }
        }
    }
    
    for i in 0..<n {
        for j in 0..<m {
            if board[i][j] == "." {
                dfs(i, j, 0, -1, 1)
            }
        }
    }

    func dfs(_ x: Int, _ y: Int, _ cnt: Int, _ prev: Int, _ moveCnt: Int) {
        if visit[x][y] { return }

        visit[x][y] = true
        for i in 0..<4 {
            let px = x + dx[i]
            let py = y + dy[i]

            if px < 0 || py < 0 || px >= n || py >= m || board[px][py] == "*" || visit[px][py] { continue }
            if prev != i {
                dfs(px, py, cnt + 1, i, moveCnt + 1)
            } else {
                dfs(px, py, cnt, i, moveCnt + 1)
            }
        }

        if moveCnt == areaCnt {
            result = min(result, cnt)
        }

        visit[x][y] = false
    }

    if result == Int.max { result = -1 }
    print("Case \(c):", result)
    c += 1
}
