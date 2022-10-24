// 알고리즘 스터디 풀이

import Foundation

let num = Int(readLine()!)!
let lineCnt = Int(readLine()!)!
var graph = [[Int]](repeating: [Int](), count: num+1)
var visit = [Bool](repeating: false, count: num+1)
var result = 0

for _ in 0..<lineCnt {
    let node = readLine()!.split(separator: " ").map { Int($0)! }
    graph[node[0]].append(node[1])
    graph[node[1]].append(node[0])
}

dfs(1)
print(result - 1)

func dfs(_ n: Int) {
    if visit[n] { return }
    visit[n] = true
    result += 1
    
    for node in graph[n] {
        dfs(node)
    }
}

// import Foundation

// let n = Int(readLine()!)!
// let m = Int(readLine()!)!
// var list = [[Int]](repeating: [Int](), count: n+1)
// var visited = [Bool](repeating: false, count: n+1)
// var result = 0

// func dfs(n: Int) {
//     if !visited[n] {
//         visited[n] = true
//         result += 1
//         for i in 0..<list[n].count {
//             dfs(n: list[n][i])
//         }
//     }
// }

// for _ in 0..<m {
//     let nodes = readLine()!.components(separatedBy: " ").map{Int(String($0))!}
//     list[nodes[0]].append(nodes[1])
//     list[nodes[1]].append(nodes[0])
// }

// dfs(n: 1)

// print(result - 1)
