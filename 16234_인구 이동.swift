import Foundation

let nlr = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = nlr[0], l = nlr[1], r = nlr[2]
var map = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
for i in 0..<n {
    map[i] = readLine()!.split(separator: " ").map { Int(String($0))! }
}
var flag = false
var result = 0
let dx = [0,1,0,-1]
let dy = [1,0,-1,0]

while !flag {
    var visit = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)
    for i in 0..<n {
        for j in 0..<n {
            // bfs
            if visit[i][j] { continue }
            visit[i][j] = true

            var queue = [(i, j)]
            var area = [(i, j)]
            var peopleCnt = 0
            while !queue.isEmpty {
                let node = queue.removeFirst()
                let x = node.0, y = node.1
                
                for i in 0..<4 {
                    let px = x + dx[i], py = y + dy[i]
                    if px < 0 || px > n-1 || py < 0 || py > n-1 || visit[px][py] || !check(map[x][y], map[px][py]) { continue }
                    visit[px][py] = true
                    queue.append((px, py))
                    area.append((px, py))
                    peopleCnt += map[px][py]
                }
            }
            
            // 인구이동
            let moveCnt = (peopleCnt + map[i][j]) / area.count
            for a in area {
                map[a.0][a.1] = moveCnt
            }
            
            if peopleCnt != 0 { flag = true }
        }
    }
    if flag { result += 1 }
    flag.toggle()
}
print(result)

// 인구이동 가능한 칸인지 확인
func check(_ prev: Int, _ next: Int) -> Bool {
    let gap = abs(prev - next)
    return gap >= l && gap <= r
}
