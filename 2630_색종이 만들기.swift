import Foundation

// 2630_색종이 만들기

// 15m

// 문제
// 정사각형 종이는 하양 or 파랑으로 칠해짐
// 조각이 모두 같은 색이 될 때 까지 4등분
// 이후 하얀색 조각과 파란색 조각의 개수 구하기

let n = Int(readLine()!)!
var paper = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)
// 파랑 true
for i in 0..<n {
    paper[i] = readLine()!.split(separator: " ").map { $0 == "1" }
}
typealias Start = (x: Int, y: Int)
typealias Node = (start: Start, size: Int)
var queue: [Node] = [((0, 0), n)]
var qIdx = 0
var white = 0
var blue = 0
while qIdx < queue.count {
    let node = queue[qIdx]
    qIdx += 1
    
    if check(node.start, node.size) {
        if paper[node.start.x][node.start.y] { blue += 1 }
        else { white += 1 }
    } else {
        queue.append(contentsOf: divide(node.start, node.size))
    }
}
print(white)
print(blue)

// 현재 네모가 모두 같은색인지 판단
func check(_ start: Start, _ size: Int) -> Bool {
    let x = start.x
    let y = start.y
    let prev = paper[x][y]
    for i in x..<x+size {
        for j in y..<y+size {
            if prev != paper[i][j] { return false }
        }
    }
    return true
}

// 4등분으로 쪼갠 배열 return
func divide(_ start: Start, _ size: Int) -> [Node] {
    let size = size / 2
    return [(start, size),
            ((start.x + size, start.y), size),
            ((start.x, start.y + size), size),
            ((start.x + size, start.y + size), size)]
}
