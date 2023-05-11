import Foundation

// 17070_파이프 옮기기 1

// 문제
// NxN격자판
// 파이프는 가로 세로 대각선(오른쪽아래로)으로 존재 가능
// 파이프를 밀 수 있는 방향 →, ↘, ↓
// 회전은 45도만 가능
// 1,1부터 N,N까지 파이프를 밀어서 이동시키는 방법의 개수
// 벽에는 파이프 못 둠

let n = Int(readLine()!)!
var h = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)
// 가 대 세
let dx = [0, 1, 1]
let dy = [1, 1, 0]
var dir = 0
typealias Point = (x: Int, y: Int, dir: Int)
var result = 0

for i in 0..<n {
    h[i] = readLine()!.split(separator: " ").map { String($0) == "0" }
}

bfs()
print(result)

func bfs() {
    var queue: [Point] = [(0, 1, 0)]
    var qIdx = 0
    
    while qIdx < queue.count {
        let node = queue[qIdx]
        qIdx += 1
        
        for i in 0...2 {
            if (node.dir == 0 && i == 2) || (node.dir == 2 && i == 0) { continue }
            
            let px = node.x + dx[i]
            let py = node.y + dy[i]
            
            if 0..<n ~= px && 0..<n ~= py {
                if i == 0 {
                    if !h[px][py] { continue }
                } else if i == 2 {
                    if !h[px][py] { continue }
                } else if i == 1 {
                    if !h[px][py] || !h[px-1][py] || !h[px][py-1] { continue }
                }
                queue.append((px, py, i))
                if px == n - 1 && py == n - 1 { result += 1 }
            }
        }
    }
}
