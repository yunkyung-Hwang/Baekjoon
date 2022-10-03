import Foundation

let n = Int(readLine()!)!
var arr = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
var maxValue = 0
var minValue = 200
for i in 0..<n {
    arr[i] = readLine()!.split(separator: " ").map { Int($0)! }
    maxValue = max(maxValue, arr[i].max()!)
    minValue = min(minValue, arr[i].min()!)
}

var result = 201
var dx = [-1, 1, 0, 0]
var dy = [0, 0, 1, -1]

func bfs(_ mn: Int) -> Bool {
    
    for m in minValue...maxValue-mn {
        var visit = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)
        guard m...m+mn ~= arr[0][0] else { continue }
        visit[0][0] = true
        
        var queue = [(0, 0)]
        while !queue.isEmpty {
            let cur = queue.removeFirst()
            
            for d in 0..<4 {
                let r = cur.0 + dx[d]
                let c = cur.1 + dy[d]
                if r < 0 || c < 0 || r >= n || c >= n { continue }
                guard !visit[r][c], m...m+mn ~= arr[r][c] else { continue }
                if r == n-1, c == n-1 { return true }
                visit[r][c] = true
                queue.append((r, c))
            }
        }
    }
    
    return false
}

var low = 0
var high = maxValue-minValue

while(low <= high) {
    let mid = (low + high)/2
    if bfs(mid) {
        result = min(result, mid)
        high = mid-1
    } else {
        low = mid+1
    }
}

print(result)
