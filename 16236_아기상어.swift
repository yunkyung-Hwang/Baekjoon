// 풀이 1)
import Foundation

let n = Int(readLine()!)!
var map = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
var visit = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)
var sharkSize = 2
var tmpSize = 0
var fishCnt = 0
var start = [0,0]
var depth = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
var result = 0
for i in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    for j in 0..<n {
        map[i][j] = input[j]
        if input[j] == 9 {
            start = [i, j]
            map[i][j] = 0
        } else if input[j] != 0 {
            fishCnt += 1
        }
    }
}

let dx = [-1, 0, 0, 1]
let dy = [0, -1, 1, 0]

var queue = [start]
var tmpQ = [(Int,Int,Int)]()
var idx = 0
reset()
visit[start[0]][start[1]] = true

bfs()
print(result)

func bfs() {
    while fishCnt != 0 && !queue.isEmpty {
        let node = queue.removeFirst()
        let px = node[0], py = node[1]
        for i in 0..<4 {
            let x = px + dx[i], y = py + dy[i]
            if x < 0 || x > n-1 || y < 0 || y > n-1 { continue }
            
            if !visit[x][y] {
                queue.append([x, y])
                visit[x][y] = true
                depth[x][y] = depth[px][py] + 1
                idx = depth[px][py]
                if map[x][y] != 0 && map[x][y] < sharkSize {
                    tmpQ.append((depth[x][y],x,y))
                }
            }
        }
        
        if idx != depth[px][py] && !tmpQ.isEmpty {
            tmpQ.sort(by: {$0 < $1})
            queue.removeAll()
            
            let x = tmpQ.first!.1, y = tmpQ.first!.2
            queue.append([x, y])
            map[x][y] = 0

            tmpQ.removeAll()
            idx = depth[px][py]
            result += depth[x][y]
            
            tmpSize += 1
            fishCnt -= 1
            if tmpSize >= sharkSize {
                tmpSize = 0
                sharkSize += 1
            }
            
            reset()
        }
    }
}

func reset() {
    for i in 0..<n {
        for j in 0..<n {
            visit[i][j] = map[i][j] > sharkSize
            depth[i][j] = 0
        }
    }
}
