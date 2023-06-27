import Foundation

// 14499_주사위 굴리기
// 1h10m

// 문제
// 주사위의 처음 좌표(x, y)와 이동 명령어가 주어졌을 때, 이동마다 주사위 상단의 값을 출력하기
// 크기가 NxM인 지도 위에 주사위가 하나 모든 면이 0인 상태로 놓여져 있다.
// 지도의 좌표는 (r, c)로 나타내며 r은 북쪽으로부터 떨어진 칸의 개수, c는 서쪽으로부터 떨어진 개수
// 주사위를 굴렸을 때 지도가 0이면 주사위 바닥의 수가 복사된다. 0이 아닌 칸이라면 칸의 수가 주사위에 복사되고 칸의 수는 0이된다.
// 범위를 벗어나는 명령은 무시한다.

// 풀이
// 주사위 상태를 2차원 배열로 관리

// 주의
// 주사위 구르는 경우 잘 생각하기

// 동 서 북 남
let dx = [0, 0, -1, 1]
let dy = [1, -1, 0, 0]
var dice = [[Int]](repeating: [Int](repeating: 0, count: 3), count: 4)
let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, m, x, y, k) = (input[0], input[1], input[2], input[3], input[4])
var map = [[Int]](repeating: [Int](repeating: 0, count: m), count: n)
for i in 0..<n {
    map[i] = readLine()!.split(separator: " ").map { Int(String($0))! }
}
let cmd = readLine()!.split(separator: " ").map { Int(String($0))! }
var now = (x: x, y: y)
// 동쪽은 1, 서쪽은 2, 북쪽은 3, 남쪽은 4
for cmd in cmd {
    if roll(dir: cmd) {
        if map[now.x][now.y] != 0 {
            dice[1][1] = map[now.x][now.y]
            map[now.x][now.y] = 0
        } else {
            map[now.x][now.y] = dice[1][1]
        }
        print(dice[3][1])
    }
}

func roll(dir: Int) -> Bool {
    if !(0..<n ~= now.x + dx[dir - 1] && 0..<m ~= now.y + dy[dir - 1]) {
        return false
    }
    switch dir {
    case 1:
        now.y += 1
        let tmp = dice[1].removeFirst()
        dice[1].append(dice[3][1])
        dice[3][1] = tmp
    case 2:
        now.y -= 1
        let tmp = dice[1].removeLast()
        dice[1].insert(dice[3][1], at: 0)
        dice[3][1] = tmp
    case 3:
        now.x -= 1
        let tmp = dice[3][1]
        for i in (1..<4).reversed() {
            dice[i][1] = dice[i-1][1]
        }
        dice[0][1] = tmp
    case 4:
        now.x += 1
        let tmp = dice[0][1]
        for i in 0..<3 {
            dice[i][1] = dice[i+1][1]
        }
        dice[3][1] = tmp
    default:
        fatalError()
    }
    return true
}
