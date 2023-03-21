import Foundation

// 1941_소문난 칠공주

// 문제
// 25명 5x5 형태의 자리배치
// 7명은 가로, 세로로 반드시 인접해야한다.
// S그룹이 4명 이상이 되어야한다.
// S들이 반드시 다 연결될 필요는 없다.
// 자리 배치 경우의 수

// 풀이
// 조합으로 S중 4명 ,5명, 6명, 7명 뽑기
//        Y중 3명, 2명, 1명 뽑기
// 뽑은 애들끼리 연결되어있는지 확인
// 7개의 원소 중 하나 잡아서 bfs 돌리고 이후 탐색 개수가 7인지 확인

// 시간복잡도
// 25명중 4명 뽑기 * 25명중 3명 뽑기 * 4 * 3 * bfs(7?)

typealias Seat = (x: Int, y:Int)
var seats = [[String]](repeating: [String](), count: 5)
var s = [Seat]()
var y = [Seat]()
let dx = [0, 0, 1, -1]
let dy = [1, -1, 0, 0]
var result = 0
for i in 0..<5 {
    seats[i] = readLine()!.map { String($0) }
    for j in 0..<5 {
        if seats[i][j] == "S" { s.append((i, j))}
        else { y.append((i, j)) }
    }
}

for i in 4...7 {
    if i > s.count || 7 - i < 0 { break }
    let ss = combination(s, i)
    let ys = combination(y, 7-i)
    
    var newS = [Seat]()
    for sss in ss {
        for yss in ys {
            newS = sss + yss
            // 연결 확인
            if check(newS) { result += 1 }
        }
    }
    
}

print(result)

func check(_ s: [Seat]) -> Bool {
    var seats = [[Bool]](repeating: [Bool](repeating: false, count: 5), count: 5)
    for s in s { seats[s.x][s.y] = true }
    
    var queue = [s.first!]
    var cnt = 1
    seats[s.first!.x][s.first!.y] = false
    while !queue.isEmpty {
        let node = queue.removeFirst()
        
        for i in 0..<4 {
            let x = node.x + dx[i]
            let y = node.y + dy[i]
            
            if 0..<5 ~= x && 0..<5 ~= y {
                if seats[x][y] {
                    seats[x][y] = false
                    queue.append((x, y))
                    cnt += 1
                }
            }
        }
    }
    
    return cnt == 7
}

func combination<T>(_ array: [T], _ n: Int) -> [[T]] {
    var result = [[T]]()
    if array.count < n { return result }
    func comb(_ index: Int, _ now: [T]) {
        if now.count == n {
            result.append(now)
            return
        }
        
        for i in index..<array.count {
            comb(i + 1, now + [array[i]])
        }
    }
    
    comb(0, [])
    
    return result
}
