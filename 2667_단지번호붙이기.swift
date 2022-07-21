import Foundation

let n = Int(readLine()!)!
var town = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
var visited = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)
var houseCnt = [Int]()
var cnt = 0
let dx = [-1, 0, 1, 0]
let dy = [0, 1, 0, -1]

for i in 0..<n {
    let s = readLine()!.map{Int(String($0))!}
    for j in 0..<n {
        town[i][j] = s[j]
    }
}

for i in 0..<n {
    for j in 0..<n {
        cnt = 0
        dfs(x: i, y: j)
        if cnt != 0 {
            houseCnt.append(cnt)
        }
    }
}

print(houseCnt.count)
houseCnt.sorted().forEach {
    print($0)
}


func dfs(x: Int, y: Int) {
    if x<0 || y<0 || x>=n || y>=n { return }
    if town[x][y] != 0 && !visited[x][y] {
        visited[x][y] = true
        cnt += 1
        for i in 0..<4{
            dfs(x: x + dx[i], y: y + dy[i])
        }
    }
}
