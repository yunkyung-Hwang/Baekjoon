import Foundation

let n = Int(readLine()!)!
var sand = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
for i in 0..<n {
    sand[i] = readLine()!.split(separator: " ").map { Int(String($0))! }
}
var result = 0
var eye = [n/2, n/2]

// 상, 좌, 하, 우   // 0, 1, 2, 3
// 1 1 7 7 10 10 2 2 5 a
let dx = [-1, 0, 1, 0]
let dy = [0, -1, 0, 1]
let xx = [[0, 0, -1, -1, -2, -2, -1, -1, -3, -2],
          [-1, 1, -1, 1, -1, 1, -2, 2, 0, 0],
          [0, 0, 1, 1, 2, 2, 1, 1, 3, 2],
          [-1, 1, -1, 1, -1, 1, -2, 2, 0, 0]]
let yy = [[-1, 1, -1, 1, -1, 1, -2, 2, 0, 0],
          [0, 0, -1, -1, -2, -2, -1, -1, -3, -2],
          [-1, 1, -1, 1, -1, 1, -2, 2, 0, 0],
          [0, 0, 1, 1, 2, 2, 1, 1, 3, 2]]
let percent = [1, 1, 7, 7, 10, 10, 2, 2, 5]

for i in 1..<n {
    // 좌, 하
    if i % 2 == 1 {
        calculate(1, i)
        calculate(2, i)
    } else { // 우, 상
        calculate(3, i)
        calculate(0, i)
    }
}

calculate(1, n-1)

print(result)

func calculate(_ dir: Int, _ cnt: Int) {
    for _ in 0..<cnt {
        tornado(r: eye[0], c: eye[1], dir: dir)
        
        switch dir {
        case 0:
            eye[0] -= 1
        case 1:
            eye[1] -= 1
        case 2:
            eye[0] += 1
        case 3:
            eye[1] += 1
        default:
            break
        }
    }
}

// x좌표와 방향을 받아 모래를 이동시키는 메서드
func tornado(r: Int, c: Int, dir: Int) {
    // x, y는 y의 좌표
    let x = r + dx[dir]
    let y = c + dy[dir]
    var alpha = sand[x][y]
    
    // 1 1 7 7 10 10 2 2 5 처리
    for i in 0..<9 {
        let px = r + xx[dir][i]
        let py = c + yy[dir][i]
        let percent = percent[i]
        let value = sand[x][y] * percent / 100
        if px < 0 || py < 0 || px > n-1 || py > n-1 { result += value }
        else { sand[px][py] += value }
        alpha -= value
    }
    
    // 알파 처리
    let px = r + xx[dir][9]
    let py = c + yy[dir][9]
    if px < 0 || py < 0 || px > n-1 || py > n-1 { result += alpha }
    else { sand[px][py] += alpha }
    
    // 모두 이동해서 y는 0
    sand[x][y] = 0
}
