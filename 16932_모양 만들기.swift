// 풀이 2)

// 풀이 1에서
// 0 1 1
// 0 0 1
// 0 1 0 를 bfs로 탐색하여
// [[0, 0], [1, 3], [1, 3]]
// [[0, 0], [0, 0], [1, 3]]
// [[0, 0], [2, 1], [0, 0]]
// 로 저장 (3차원 배열)하던거를
// 그룹별 합(개수) 값을 가지는 group 배열로 저장 // 그룹 인덱스로 바로 접근할 수 있게

// 그룹별 합 값을 저장할 때 큐 말고 그냥 저장해서 반복문 돌기

// array 대신 set 사용 -> contain 함수 

import Foundation

let nm = readLine()!.split(separator: " ").map { Int($0)! }
let n = nm[0]
let m = nm[1]
var arr = [[Int]](repeating: [Int](repeating: 0, count: m), count: n)
var visit = [[Bool]](repeating: [Bool](repeating: false, count: m), count: n)
var group = [Int](repeating: 0, count: 1000001)
for i in 0..<n {
    arr[i] = readLine()!.split(separator: " ").map { Int($0)! }
}
let dx = [-1, 0, 1, 0]
let dy = [0, -1, 0, 1]
var idx = 1
var result = 0

for i in 0..<n {
    for j in 0..<m {
        if !visit[i][j] && arr[i][j] == 1 {
            bfs(r: i, c: j, idx: idx)
            idx += 1
        }
    }
}

for i in 0..<n {
    for j in 0..<m {
        if arr[i][j] == 0 {
            var sum = 0
            var prev = Set<Int>()
            for k in 0..<4 {
                let px = i + dx[k]
                let py = j + dy[k]
                if px < 0 || py < 0 || px >= n || py >= m || arr[px][py] == 0 { continue }
                prev.insert(arr[px][py])
            }
            for v in prev {
                sum += group[v]
            }
            result = max(result, sum)
        }
    }
}
print(result + 1)

func bfs(r: Int, c: Int, idx: Int) {
    var queue = [(r, c)]
    var tmp = [(r, c)]
    visit[r][c] = true
    arr[r][c] = idx
    var cnt = 1

    while !queue.isEmpty {
        let node = queue.removeFirst()

        for i in 0..<4 {
            let px = node.0 + dx[i]
            let py = node.1 + dy[i]

            if px < 0 || py < 0 || px >= n || py >= m || visit[px][py] { continue }
            if arr[px][py] == 1 && !visit[px][py] {
                cnt += 1
                visit[px][py] = true
                queue.append((px, py))
                tmp.append((px, py))
                arr[px][py] = idx
            }
        }
    }
    
    for t in tmp {
        group[arr[t.0][t.1]] = cnt
    }
}

// 풀이 1) - 시간초과
// import Foundation

// let nm = readLine()!.split(separator: " ").map { Int($0)! }
// let n = nm[0]
// let m = nm[1]
// var arr = [[[Int]]](repeating: [[Int]](repeating: [Int](repeating: 0, count: 2), count: m), count: n)
// var visit = [[Bool]](repeating: [Bool](repeating: false, count: m), count: n)
// for i in 0..<n {
//     let tmp = readLine()!.split(separator: " ").map { Int($0)! }
//     for j in 0..<tmp.count {
//         arr[i][j][0] = tmp[j]
//     }
// }
// let dx = [-1, 0, 1, 0]
// let dy = [0, -1, 0, 1]
// var idx = 1
// var result = 0

// for i in 0..<n {
//     for j in 0..<m {
//         if !visit[i][j] && arr[i][j][0] == 1 {
//             bfs(r: i, c: j, idx: idx)
//             idx += 1
//         }
//     }
// }

// for i in 0..<n {
//     for j in 0..<m {
//         if arr[i][j][0] == 0 {
//             var sum = 0
//             var prev = [Int]()
//             for k in 0..<4 {
//                 let px = i + dx[k]
//                 let py = j + dy[k]
//                 if px < 0 || py < 0 || px >= n || py >= m || arr[px][py][0] == 0 || prev.contains(arr[px][py][0]) { continue }
//                 prev.append(arr[px][py][0])
//                 sum += arr[px][py][1]
//             }
//             result = max(result, sum)
//         }
//     }
// }
// print(result + 1)

// func bfs(r: Int, c: Int, idx: Int) {
//     var queue = [(r, c)]
//     var tmp = [(r, c)]
//     visit[r][c] = true
//     arr[r][c][0] = idx
//     var cnt = 1

//     while !queue.isEmpty {
//         let node = queue.removeFirst()

//         for i in 0..<4 {
//             let px = node.0 + dx[i]
//             let py = node.1 + dy[i]

//             if px < 0 || py < 0 || px >= n || py >= m || visit[px][py] { continue }
//             if arr[px][py][0] == 1 && !visit[px][py] {
//                 cnt += 1
//                 visit[px][py] = true
//                 queue.append((px, py))
//                 tmp.append((px, py))
//                 arr[px][py][0] = idx
//             }
//         }
//     }
    
//     while !tmp.isEmpty {
//         let node = tmp.removeFirst()
        
//         arr[node.0][node.1][1] = cnt
//     }
// }
