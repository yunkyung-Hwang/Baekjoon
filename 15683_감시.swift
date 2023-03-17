import Foundation

// 15683 감시

// 문제
// CCTV는 직선 방향으로 다 확인할 수 있음
// 단, 벽은 통과 못하고 CCTV는 통과 가능
// CCTV는 90도씩 회전 가능
// 각 CCTV의 위치는 정해져있고 회전해서 사각지대의 최소 크기 구하기
// CCTV 최대 8대

// 시간복잡도
// 8대 4방향 탐색 -> 4^8 = 2^16 = 65536
// 각 CCTV마다 16개씩 확인

// 풀이
// dx, dy 상하좌우(0,1,2,3)에 맞춰 CCTV마다 확인해야하는 방향 배열 만들기
// CCTV의 위치를 저장하는 배열을 만들고 해당 배열 dfs돌기
// 중복 방문 처리를 해주기 위해서 [[Int]]형 visit배열 만들고 방문 시 +1, 방문 철회 시 -1
// 마지막 CCTV까지 확인하면 0 개수 세서 갱신하기

let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, m) = (nm[0], nm[1])
var map = [[Int]](repeating: [Int](repeating: 0, count: m), count: n)
var visit = [[Int]](repeating: [Int](repeating: 0, count: m), count: n)
var cctv = [[Int]]()
var result = Int.max

// 상하좌우
let dx = [-1, 1, 0, 0]
let dy = [0, 0, -1, 1]

for i in 0..<n {
    map[i] = readLine()!.split(separator: " ").map { Int(String($0))! }
    for j in 0..<map[i].count {
        if map[i][j] != 0 && map[i][j] != 6 {
            cctv.append([i, j])
        }
    }
}

dfs(idx: 0)
print(result)

func dfs(idx: Int) {
    if idx >= cctv.count {
        // 종료 조건. 개수 확인 및 갱신
        var tmp = 0
        for i in 0..<n {
            for j in 0..<m {
                if visit[i][j] == 0 && map[i][j] != 6 && !cctv.contains([i, j]) { tmp += 1 }
            }
        }
        result = min(result, tmp)
        return
    }
    
    let x = cctv[idx][0]
    let y = cctv[idx][1]
    
    for dir in checkDir(x: x, y: y, num: map[x][y]) {
        // dir에 대해서 방문 처리
        checkVisit(isVisted: true)
        
        // 다음 cctv dfs
        dfs(idx: idx + 1)
        
        // dir에 대해서 방문 해제
        checkVisit(isVisted: false)
        
        func checkVisit(isVisted: Bool) {
            for d in dir {
                var px = x + dx[d]
                var py = y + dy[d]
                while 0..<n ~= px && 0..<m ~= py {
                    if map[px][py] == 6 { break }
                    visit[px][py] += isVisted ? 1 : -1
                    px += dx[d]
                    py += dy[d]
                }
            }
        }
    }
}


func checkDir(x: Int, y: Int, num: Int) -> [[Int]] {
    switch num {
    case 1:
        return [[0], [1], [2], [3]]
    case 2:
        return [[0, 1], [2, 3]]
    case 3:
        return [[0, 2], [0, 3], [1, 2], [1, 3]]
    case 4:
        return [[0, 2, 3], [0, 1, 3], [1, 2, 3], [0, 1, 2]]
    case 5:
        return [[0, 1, 2, 3]]
    default:
        fatalError()
    }
}
