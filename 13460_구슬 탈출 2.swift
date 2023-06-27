import Foundation

// 13460_구슬 탈출 2

// 문제
// 두 개의 구슬을 기울여 굴려서 빨간 구슬을 구멍에 빠트려야한다.
// 최소 몇 번만에 구슬을 구멍에서 빼낼 수 있는지 구하기
// 불가능한 경우 -1

// 풀이
// bfs로 가능한 방향 큐에 넣고 카운트 세기
// 파란공이 빠지지 않는 경우에만 큐에 넣고
// 이동중 빨간 공이 홀을 지나가면 그만
// 빨간공 기준 visited 배열 선언

// 주의
// 문제 잘 읽기 10회 초과일경우 -1

struct Point: Hashable {
    var x: Int
    var y: Int
    
    static func == (lhs: Point, rhs: Point) -> Bool {
        lhs.x == rhs.x && lhs.y == rhs.y
    }
}

struct Balls: Hashable {
    let red: Point
    let blue: Point
    
    static func == (lhs: Balls, rhs: Balls) -> Bool {
        lhs.red == rhs.red && lhs.blue == rhs.blue
    }
}

let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, m) = (nm[0], nm[1])
var map = [[Bool]](repeating: [Bool](repeating: false, count: m), count: n)
typealias AAA = (red: Point, blue: Point, moveCount: Int)
var red: Point = Point(x: 0, y: 0)
var blue: Point = Point(x: 0, y: 0)
var hole: Point = Point(x: 0, y: 0)
for i in 0..<n {
    let input = Array(readLine()!)
    for j in 0..<input.count {
        if input[j] == "R" {
            red = Point(x: i, y: j)
        } else if input[j] == "B" {
            blue = Point(x: i, y: j)
        } else if input[j] == "O" {
            hole = Point(x: i, y: j)
        }
        map[i][j] = input[j] != "#"
    }
}

let dx = [0, 0, -1, 1]
let dy = [-1, 1, 0, 0]

var visited = Set<Balls>()
visited.insert(Balls(red: red, blue: blue))
var queue: [AAA] = [(red, blue, 0)]
var qIdx = 0
var result = Int.max

while qIdx < queue.count {
    let node = queue[qIdx]
    qIdx += 1
    
    for i in 0..<4 {
        // 일단 움직여보고
        let moveResult = move(red: node.red, blue: node.blue, dir: i)
        // 이동 가능하고 방문 안한 지점이면
        if moveResult.possible && !visited.contains(Balls(red: moveResult.red, blue: moveResult.blue)) {
            // 구멍에 빠진거면 return
            if moveResult.red == hole && moveResult.blue != hole {
                result = min(result, node.moveCount + 1)
                continue
            }
            // 방문처리하고
            visited.insert(Balls(red: moveResult.red, blue: moveResult.blue))
            // 큐에 넣기
            queue.append((moveResult.red, moveResult.blue, node.moveCount + 1))
        }
    }
}

print(result == Int.max || result > 10 ? -1 : result)

// 다음칸으로 움직일 수 있는가 판단
func canMove(_ ball: Point, _ dir: Int) -> Bool {
    let px = ball.x + dx[dir]
    let py = ball.y + dy[dir]
    return 0..<n ~= px && 0..<m ~= py && map[px][py]
}

// 두 개의 공을 기울여 얻은 결과
func move(red: Point, blue: Point, dir: Int) -> (red: Point, blue: Point, possible: Bool) {
    var red = red, blue = blue
    var flag = true
    var isDropped = false
    var isPossible = true
    var moveCount = 0
    // 공이 둘 중 하나라도 이동할 수 있는 동안
    while flag {
        let redFlag = isDropped ? false : canMove(red, dir)
        let blueFlag = canMove(blue, dir)
        flag = redFlag || blueFlag
        if !flag { break }
        
        moveCount += 1
        // 각 한 칸 움직이기
        if redFlag {
            red.x += dx[dir]
            red.y += dy[dir]
            if red == hole {
                isDropped = true
            }
        }
        if blueFlag {
            blue.x += dx[dir]
            blue.y += dy[dir]
            // 파란공 빠지면 종료
            if blue == hole {
                isPossible = false
                break
            }
        }
        
        // 단, 공이 겹치면
        if red == blue && red != hole {
            if redFlag {
                red.x -= dx[dir]
                red.y -= dy[dir]
            }
            if blueFlag {
                blue.x -= dx[dir]
                blue.y -= dy[dir]
            }
            isPossible = moveCount != 1
            break
        }
    }
    return (red, blue, isPossible)
}
