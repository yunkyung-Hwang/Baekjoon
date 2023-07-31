import Foundation

// 17780_새로운 게임

let nk = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, k) = (nk[0], nk[1])
/// 보드판의 색깔
var color = [[Int]](repeating: [Int](repeating: -1, count: n), count: n)
for i in 0..<n {
    color[i] = readLine()!.split(separator: " ").map { Int(String($0))! }
}
typealias Piece = (num: Int, r: Int, c: Int, dir: Int)
/// 보드에 놓여있는 기물 현황
var board = [[[Piece]]](repeating: [[Piece]](repeating: [Piece](), count: n), count: n)
/// n번째 말을 저장하는 기물 배열
var pieces = [Piece]()
for i in 0..<k {
    let p = readLine()!.split(separator: " ").map { Int(String($0))! }
    let piece = (i, p[0]-1, p[1]-1, p[2]-1)
    board[p[0]-1][p[1]-1].append(piece)
    pieces.append(piece)
}
// 우 좌 상 하
let dx = [0, 0, -1, 1]
let dy = [1, -1, 0, 0]

var result = 0
solve()
print(result > 1000 ? -1 : result)

func solve() {
    while true {
        result += 1
        for i in 0..<k {
            if move(i, pieces[i].r, pieces[i].c) >= 4 { return }
        }
        if result > 1000 { return }
    }
}

func check() -> Bool {
    for i in 0..<n {
        for j in 0..<n {
            if board[i][j].count >= 4 { return true }
        }
    }
    return false
}

/// [r, c]에 있는 i번째 말(부터 끝까지)을 움직이고 해당 칸의 개수를 반환하는 메서드
func move(_ num: Int, _ r: Int, _ c: Int) -> Int {
    let b = board[r][c]
    
    // 마지막 말이 아닌 경우
    if b[0].num != num { return 0 }
    
    var tryCnt = 0
    while tryCnt < 2 {
        // 이동할 칸
        let x = r + dx[pieces[num].dir]
        let y = c + dy[pieces[num].dir]
        
        if x < 0 || x >= n || y < 0 || y >= n || color[x][y] == 2 {
            // 넘어가거나 파랑
            // 방향 반대로 바꾸기
            if tryCnt == 0 { pieces[num].dir = changeDir(pieces[num].dir) }
            tryCnt += 1
        } else if color[x][y] == 1 {
            // 빨강
            board[x][y].append(contentsOf: b.reversed())
            board[r][c].removeAll()
            for movingPiece in b {
                pieces[movingPiece.num].r = x
                pieces[movingPiece.num].c = y
            }
            return board[x][y].count
        } else {
            // 하양
            board[x][y].append(contentsOf: b)
            board[r][c].removeAll()
            for movingPiece in b {
                pieces[movingPiece.num].r = x
                pieces[movingPiece.num].c = y
            }
            return board[x][y].count
        }
    }
    return board[r][c].count
}

/// 방향 바꾸기
func changeDir(_ dir: Int) -> Int {
    switch dir {
    case 0:
        return 1
    case 1:
        return 0
    case 2:
        return 3
    case 3:
        return 2
    default:
        fatalError()
    }
}
