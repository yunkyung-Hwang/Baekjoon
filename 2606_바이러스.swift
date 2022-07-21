import Foundation

let n = Int(readLine()!)!
let m = Int(readLine()!)!
var list = [[Int]](repeating: [Int](), count: n+1)
var visited = [Bool](repeating: false, count: n+1)
var result = 0

func dfs(n: Int) {
    if !visited[n] {
        visited[n] = true
        result += 1
        for i in 0..<list[n].count {
            dfs(n: list[n][i])
        }
    }
}

for _ in 0..<m {
    let nodes = readLine()!.components(separatedBy: " ").map{Int(String($0))!}
    list[nodes[0]].append(nodes[1])
    list[nodes[1]].append(nodes[0])
}

dfs(n: 1)

print(result - 1)
