import Foundation

let nm = readLine()!.split(separator: " ").map { Int($0)! }
let m = nm[0]
let n = nm[1]
var tomatos = [[Int]](repeating: [Int](repeating: 0, count: m), count: n)
var visit = [[Bool]](repeating: [Bool](repeating: false, count: m), count: n)
let dx = [-1, 0, 1, 0]
let dy = [0, -1, 0, 1]
var result = 0
var numberOfTomato = 0

for i in 0..<n {
    tomatos[i] = readLine()!.split(separator: " ").map { Int($0)! }
    for tomato in tomatos[i] {
        if tomato == 1 {
            numberOfTomato += 1
        }
    }
}

bfs()

for i in 0..<n {
    for j in 0..<m {
        if visit[i][j] == false && tomatos[i][j] != -1 {
            print(-1)
            exit(0)
        }
    }
}

print(result - 1)

func bfs() {
    var queue = [(0, 0)]
    queue.removeFirst()
    for i in 0..<n {
        for j in 0..<m {
            if tomatos[i][j] == 1 {
                queue.append((i, j))
                visit[i][j] = true
            }
        }
    }
    
    if queue.count != numberOfTomato {
        print(0)
        exit(0)
    }
    
    while !queue.isEmpty {
        for _ in 0..<queue.count {
            let node = queue.removeFirst()
            let x = node.0
            let y = node.1
            
            for i in 0..<4 {
                let px = x + dx[i]
                let py = y + dy[i]
                
                if px < 0 || py < 0 || px >= n || py >= m || visit[px][py] { continue }
                if tomatos[px][py] == -1 {
                    visit[px][py] = true
                    continue
                }
                queue.append((px, py))
                visit[px][py] = true
            }
        }
        result += 1
    }
}
