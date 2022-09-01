import Foundation

let n = Int(readLine()!)!
var s = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
var visit = [Bool](repeating: false, count: n)
var result = Int.max

for i in 0..<n {
    let tmp = readLine()!.split(separator: " ").map { Int($0)! }
    s[i] = tmp
}

dfs(cnt: 0, idx: 0)
print(result)

func dfs(cnt: Int, idx: Int) {
    if cnt == n / 2 {
        result = min(result, calculate())
        if result == 0 {
            print(0)
            exit(0)
        }
    } else {
        for i in idx..<n {
            if visit[i] { continue }
            visit[i] = true
            dfs(cnt: cnt+1, idx: i+1)
            visit[i] = false
        }
    }
}

func calculate() -> Int {
    var start = 0
    var link = 0
    
    for i in 0..<n-1 {
        for j in i..<n {
            if visit[i] && visit[j] {
                start += s[i][j]
                start += s[j][i]
            } else if !visit[i] && !visit[j] {
                link += s[i][j]
                link += s[j][i]
            }
        }
    }
    
    return abs(start - link)
}
