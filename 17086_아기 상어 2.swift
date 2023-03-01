import Foundation

// 17086 아기 상어 2

// 문제
// N X M 공간에 아기상어 여러마리
// 안전거리: 가장 가까운 아기상어와의 거리
// 대각선으로도 이동 가능!!
// 안전거리가 가장 큰 칸 구하기

// 풀이
// dx와 dy를 대각선 포함 만든다
// 빈칸마다 bfs 돌리기
// 아기상어인 칸을 만나면 bfs의 depth를 return

// 시간복잡도
// N,M <= 50
// 빈칸마다 bfs
// O(N * M * N * M) = 50 * 50 * 50 * 50 = 6250000

let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, m) = (nm[0], nm[1])
var graph = [[Int]](repeating: [Int](repeating: 0, count: m), count: n)
var result = 0

let dx = [-1, -1, -1, 0, 0, 1, 1, 1]
let dy = [-1, 0, 1, -1, 1, -1, 0, 1]

for i in 0..<n {
    graph[i] = readLine()!.split(separator: " ").map { Int(String($0))! }
}

for i in 0..<n {
    for j in 0..<m {
        if graph[i][j] == 0 { result = max(result, bfs(i, j)) }
    }
}

print(result)

func bfs(_ i: Int, _ j: Int) -> Int {
    var visit = [[Bool]](repeating: [Bool](repeating: false, count: m), count: n)
    var depth = [[Int]](repeating: [Int](repeating: 0, count: m), count: n)
    
    var queue = [(i, j)]
    visit[i][j] = true
    depth[i][j] = 0
    
    while !queue.isEmpty {
        let node = queue.removeFirst()
        let x = node.0, y = node.1
        
        for i in 0..<8 {
            let px = x + dx[i]
            let py = y + dy[i]
            
            if 0..<n ~= px && 0..<m ~= py && !visit[px][py] {
                queue.append((px, py))
                visit[px][py] = true
                depth[px][py] = depth[x][y] + 1
                
                if graph[px][py] == 1 {
                    return depth[px][py]
                }
            }
        }
    }
    return -1
}
