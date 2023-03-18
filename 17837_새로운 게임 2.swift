import Foundation

// 17837 새로운 게임 2

// 문제
// N x N인 체스판, 사용하는 말의 개수 k개
// 말은 원판 모양이고 하나의 말 위에 다른 말을 올릴 수 있다.
// 체스판은 각 흰색, 빨간색, 파란색 중 하나로 색칠되어있다.
// 말은 1~k번까지 번호가 매겨져있고 이동 방향도 상하좌우 중 하나로 정해져 있다.
// 턴 한 번에 모든 말을 순서대로 이동시킨다. 올라타져있는 말도 같이 이동된다.
// 말이 4개 이상 쌓이면 게임이 종료된다.
// 흰색: 이동. 이미 말이 있으면 가장 위에 올린다.
// 빨간색: 이동. 이미 말이 있으면 가장 위에 이동하는 애들만 역순으로 올린다.
// 파란색: 이동 방향을 반대로 바꾸고 한 칸 이동한다. 바꾼 후에도 파란색( or 벗어남)이면 이동하지 않고 가만히 있는다.
// 벗어남: 파란색과 동일

// 풀이
// 단순 구현
// i번째 말의 정보를 저장하는 pieces 배열 돌면서 순서대로 이동
// 이동 후 4개 이상인지 확인
// 말의 겹침상태를 나타내는 board: [[[Piece]]] 배열을 만들고 해당 인덱스부터 잘라내서 옮기기

let nk = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, k) = (nk[0], nk[1])
var color = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
typealias Piece = (num: Int, r: Int, c: Int, dir: Int)
var board = [[[Piece]]](repeating: [[Piece]](repeating: [Piece](), count: n), count: n)
var pieces = [Piece]()
// 우 좌 상 하
let dx = [0, 0, -1, 1]
let dy = [1, -1, 0, 0]

for i in 0..<n {
    color[i] = readLine()!.split(separator: " ").map { Int(String($0))! }
}

for i in 0..<k {
    let p = readLine()!.split(separator: " ").map { Int(String($0))! }
    let piece = (i, p[0]-1, p[1]-1, p[2]-1)
    board[p[0]-1][p[1]-1].append(piece)
    pieces.append(piece)
}

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
    var idx = 0
    for i in 0..<b.count {
        if b[i].num == num { idx = i }
    }
    // 옮길 애들 빼기
    let movingPieces = b[idx...]
    
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
            board[x][y].append(contentsOf: movingPieces.reversed())
            board[r][c].removeSubrange(idx...)
            for movingPiece in movingPieces {
                pieces[movingPiece.num].r = x
                pieces[movingPiece.num].c = y
            }
            return board[x][y].count
        } else {
            // 하양
            board[x][y].append(contentsOf: movingPieces)
            board[r][c].removeSubrange(idx...)
            for movingPiece in movingPieces {
                pieces[movingPiece.num].r = x
                pieces[movingPiece.num].c = y
            }
            return board[x][y].count
        }
    }
    return board[r][c].count
}

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
