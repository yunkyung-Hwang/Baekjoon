import Foundation

let nmv = readLine()!.split(separator: " ").map { Int($0)! }
let n = nmv[0]
let m = nmv[1]
let v = nmv[2]
var nodes = [[Int]](repeating: [Int](), count: 10001)
var visit = [Bool](repeating: false, count: 1001)
var d = [String]()
var b = [String]()

for _ in 0..<m {
    let line = readLine()!.split(separator: " ").map { Int($0)! }
    nodes[line[0]].append(line[1])
    nodes[line[1]].append(line[0])
}

for i in 0..<nodes.count {
    nodes[i].sort()
}

dfs(num: v)
print(d.joined(separator: " "))

for i in 0..<visit.count {
    visit[i] = false
}

bfs(num: v)
print(b.joined(separator: " "))

func dfs(num: Int) {
    d.append(String(num))
    visit[num] = true
    
    for i in 0..<nodes[num].count {
        if !visit[nodes[num][i]] {
            dfs(num: nodes[num][i])
        }
    }
}

func bfs(num: Int) {
    var q = [Int]()
    q.append(num)
    visit[num] = true
    
    while !q.isEmpty {
        let node = q.removeFirst()
        b.append(String(node))
        
        for i in 0..<nodes[node].count {
            if !visit[nodes[node][i]] {
                q.append(nodes[node][i])
                visit[nodes[node][i]] = true
            }
        }
    }
}
