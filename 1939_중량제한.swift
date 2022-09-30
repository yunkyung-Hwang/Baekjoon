import Foundation

let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])
var bridges = [[(Int, Int)]](repeating: [], count: n+1)
var result = 0
var low = 0
var high = 0
for _ in 0..<m {
    let bridge = readLine()!.split(separator: " ").map { Int($0)! }
    bridges[bridge[0]].append((bridge[1], bridge[2]))
    bridges[bridge[1]].append((bridge[0], bridge[2]))
    high = max(high, bridge[2])
}
let ft = readLine()!.split(separator: " ").map { Int($0)! }
let (from, to) = (ft[0], ft[1])

while low <= high {
    let mid = (low + high) / 2
    
    if bfs(mid) {
        result = mid
        low = mid + 1
    } else {
        high = mid - 1
    }
}

print(result)

func bfs(_ weight: Int) -> Bool {
    var visit = Array(repeating: false, count: n+1)
    
    var queue = [from]
    var idx = 0
    
    visit[from] = true
    
    while queue.count > idx {
        let cur = queue[idx]
        idx += 1
        
        if cur == to { return true }
        
        for (island, w) in bridges[cur] {
            if !visit[island] && w >= weight {
                visit[island] = true
                queue.append(island)
            }
        }
    }
    
    return false
}
