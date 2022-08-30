import Foundation

let n = Int(readLine()!)!
var s = [[Int]]()
var visit = [Bool](repeating: false, count: n)
var result = Int.max

for _ in 0..<n {
    s.append(readLine()!.split(separator: " ").map{ Int(String($0))! })
}
dfs(idx: 0, cnt: 0)
print(result)

func dfs(idx: Int, cnt: Int) {
    if cnt == n / 2 {
        calculate()
        return
    }
    
    for i in idx..<n {
        if !visit[i] {
            visit[i] = true
            dfs(idx: i + 1, cnt: cnt + 1)
            visit[i] = false
        }
    }
}

// 능력치 
func calculate() {
    var start = 0
    var link = 0
    
    for i in 0..<n-1 {
        for j in i+1..<n {
            if visit[i] && visit[j] {
                start += s[i][j]
                start += s[j][i]
            } else if !visit[i] && !visit[j] {
                link += s[i][j]
                link += s[j][i]
            }
        }
    }
    
    let tmp = abs(start - link)
    
    if tmp == 0 {
        print(tmp)
        exit(0)
    }
    
    result = min(result, tmp)
}
