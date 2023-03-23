// 3달만에 갱신
// 시간 60ms -> 12ms
import Foundation

// 16236_아기 상어

// 문제
// NxN공간에 물고기 M마리와 아기 상어 1마리가 있다
// 상어는 더 이상 물고기를 먹을 수 없을 때까지 이동한다.
// 아기 상어의 크기는 초기 2부터 자신보다 크기가 작은 물고기를 먹을 수 있다.
// 먹을 수 있는 물고기가 여러 마리라면 가장 가까이 있는 물고기를 먹으러 간다.
// 이동 거리는 도달할때까지 지나가는 칸 개수의 최소값이다.
// 거리가 동일하다면 가장 위에 있는 물고기를, 이런 물고기가 여러마리라면 가장 왼쪽의 물고기를 먹으러 간다.
// 크기가 작은 물고기를 본인의 크기만큼 먹으면 크기가 1 증가한다.
// 크기가 큰 물고기가 있는 칸으로는 이동할 수 없다.
// 크기가 같은 물고기가 있는 칸으로는 지나갈 수만 있다.
// 한 칸을 이동하는데 1초가 걸린다.
// 아기상어가 몇 초동안 잡아먹는지 구해라

// 풀이
// 물고기를 먹으러 출발할 때 마다 bfs돌려서 먹을 수 있는 가장 가까운 물고기 찾기
// 물고기를 먹을때마다 feed값 -= 1
// feed값이 0이 되면 상어 크기 += 1, feed = 상어 크기
// 먹으러 갈 물고기가 없을때까지 진행 -> bfs queue가 빌때까지
// 값을 저장시켜놓을수도 없고 이건 그냥 bfs + 구현

let n = Int(readLine()!)!
var map = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
typealias Fish = (x: Int, y: Int, distance: Int)
let dx = [0, 0, -1, 1]
let dy = [-1, 1, 0, 0]
var shark = (x: -1, y: -1, size: 2)
var moveCnt = 0
for i in 0..<n {
    map[i] = readLine()!.split(separator: " ").map { Int(String($0))! }
    if shark == (-1, -1, 2) {
        for j in 0..<n {
            if map[i][j] == 9 {
                shark = (i, j, 2)
                map[i][j] = 0
            }
        }
    }
}

var cnt = shark.size
while true {
    let fishes = getFish()
    if fishes.count == 0 { break }
    // 여러마리라면 가장 위의 가장 왼쪽 물고기를 먹기
    let fish = fishes.sorted { ($0.x, $0.y) < ($1.x, $1.y) }[0]
    cnt -= 1
    // 상어 크기만큼 물고기 먹으면 상어 성장
    if cnt == 0 {
        shark.size += 1
        cnt = shark.size
    }
    (shark.x, shark.y) = (fish.x, fish.y)
    moveCnt += fish.distance
    map[fish.x][fish.y] = 0
}

print(moveCnt)

func getFish() -> [Fish] {
    var fishes = [Fish]()
    var visit = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)
    
    var queue = [Fish(shark.x, shark.y, 0)]
    var distance = Int.max
    visit[shark.x][shark.y] = true
    
    var qIdx = 0
    while qIdx < queue.count {
        let fish = queue[qIdx]
        qIdx += 1
        if fish.distance > distance { continue }
        for i in 0..<4 {
            let x = fish.x + dx[i]
            let y = fish.y + dy[i]
            
            if 0..<n ~= x && 0..<n ~= y && !visit[x][y] && map[x][y] <= shark.size {
                visit[x][y] = true
                if map[x][y] == 0 || map[x][y] == shark.size {
                    // 0이거나 크기가 같으면 큐에 넣어서 이동
                    queue.append((x, y, fish.distance + 1))
                } else if fish.distance + 1 <= distance {
                    // 물고기고 크기가 작고 최소거리면 fishes에 넣기
                    fishes.append((x, y, fish.distance + 1))
                    distance = fish.distance + 1
                }
                
            }
        }
    }
    return fishes
}

// 풀이 1)
// import Foundation

// let n = Int(readLine()!)!
// var map = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
// var visit = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)
// var sharkSize = 2
// var tmpSize = 0
// var fishCnt = 0
// var start = [0,0]
// var depth = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
// var result = 0
// for i in 0..<n {
//     let input = readLine()!.split(separator: " ").map { Int(String($0))! }
//     for j in 0..<n {
//         map[i][j] = input[j]
//         if input[j] == 9 {
//             start = [i, j]
//             map[i][j] = 0
//         } else if input[j] != 0 {
//             fishCnt += 1
//         }
//     }
// }

// let dx = [-1, 0, 0, 1]
// let dy = [0, -1, 1, 0]

// var queue = [start]
// var tmpQ = [(Int,Int,Int)]()
// var idx = 0
// reset()
// visit[start[0]][start[1]] = true

// bfs()
// print(result)

// func bfs() {
//     while fishCnt != 0 && !queue.isEmpty {
//         let node = queue.removeFirst()
//         let px = node[0], py = node[1]
//         for i in 0..<4 {
//             let x = px + dx[i], y = py + dy[i]
//             if x < 0 || x > n-1 || y < 0 || y > n-1 { continue }
            
//             if !visit[x][y] {
//                 queue.append([x, y])
//                 visit[x][y] = true
//                 depth[x][y] = depth[px][py] + 1
//                 idx = depth[px][py]
//                 if map[x][y] != 0 && map[x][y] < sharkSize {
//                     tmpQ.append((depth[x][y],x,y))
//                 }
//             }
//         }
        
//         if idx != depth[px][py] && !tmpQ.isEmpty {
//             tmpQ.sort(by: {$0 < $1})
//             queue.removeAll()
            
//             let x = tmpQ.first!.1, y = tmpQ.first!.2
//             queue.append([x, y])
//             map[x][y] = 0

//             tmpQ.removeAll()
//             idx = depth[px][py]
//             result += depth[x][y]
            
//             tmpSize += 1
//             fishCnt -= 1
//             if tmpSize >= sharkSize {
//                 tmpSize = 0
//                 sharkSize += 1
//             }
            
//             reset()
//         }
//     }
// }

// func reset() {
//     for i in 0..<n {
//         for j in 0..<n {
//             visit[i][j] = map[i][j] > sharkSize
//             depth[i][j] = 0
//         }
//     }
// }
