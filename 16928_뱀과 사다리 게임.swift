import Foundation

let nm = readLine()!.split(separator: " ").map{ Int($0)! }
let n = nm[0]
let m = nm[1]
var board = [[Int]](repeating: [Int](repeating: 0, count: 2), count: n+m)
var locationAndCount = [[Int]]()
var visit = [Bool](repeating: false, count: 101)

for i in 0..<n+m {
    board[i] = readLine()!.split(separator: " ").map{ Int($0)! }
}

locationAndCount.append([1,0])
visit[1] = true

var idx = 0
while locationAndCount.count > idx {
    var now = locationAndCount[idx]
    idx += 1
    
    // 100 도착
    if now[0] == 100 {
        print(now[1])
        break
    }
    
    // 이동
    for location in board {
        if now[0] == location[0] {
            now[0] = location[1]
        }
    }
    
    // 주사위
    for i in 1...6 {
        let move = now[0] + i
        if move > 100 || visit[move] { continue }
        
        locationAndCount.append([move, now[1] + 1])
        visit[move] = true
    }
}
