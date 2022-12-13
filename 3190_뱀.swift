import Foundation

let n = Int(readLine()!)!
let appleCnt = Int(readLine()!)!
var board = [[Bool]](repeating: [Bool](repeating: false, count: n+1), count: n+1)
var snake = [[1,1]]
var result = 0
for _ in 0..<appleCnt {
    let apple = readLine()!.split(separator: " ").map { Int(String($0))! }
    board[apple[0]][apple[1]] = true
}
var l = Int(readLine()!)!
var dir = [[Int]](repeating: [Int](repeating: 0, count: 2), count: l)
for i in 0..<l {
    let d = readLine()!.split(separator: " ").map { String($0) }
    dir[i] = [Int(d[0])!, d[1] == "D" ? 1 : -1]
}
// 우하좌상 =  0, 1, 2, 3
let dirX = [0, 1, 0, -1]
let dirY = [1, 0, -1, 0]

var idx = 0
var moveDir = 0

while true {
    result += 1
    if !move([dirX[moveDir], dirY[moveDir]]) { break }
    
    if idx < l && result >= dir[idx][0] {
        rotate()
        idx += 1
    }
}

print(result)

func move(_ dir: [Int]) -> Bool {
    let x = snake[0][0] + dir[0]
    let y = snake[0][1] + dir[1]
    if x < 1 || x > n || y < 1 || y > n || snake.contains([x, y]) { return false }
    
    snake.insert([snake[0][0] + dir[0], snake[0][1] + dir[1]], at: 0)
    if !board[snake.first![0]][snake.first![1]] {
        snake.removeLast()
    } else {
        board[snake.first![0]][snake.first![1]] = false
    }
    return true
}

func rotate() {
    moveDir += dir[idx][1]
    if moveDir > 3 {
        moveDir = 0
    } else if moveDir < 0 {
        moveDir = 3
    }
}
