import Foundation

let nm = readLine()!.split(separator: " ").map { Int($0)! }
let n = nm[0]
let m = nm[1]
var map = [[Int]](repeating: [Int](repeating: 0, count: m), count: n)
var safe = [[Int]]()
var virus = [[Int]]()
let dx = [-1, 0, 1, 0]
let dy = [0, 1, 0, -1]
var result = 0

// map, 안전영역, 바이러스 영역 입력
for i in 0..<n {
    let tmp = readLine()!.split(separator: " ").map { Int($0)! }
    for j in 0..<m {
        map[i][j] = tmp[j]
        
        if tmp[j] == 0 { safe.append([i,j]) }
        else if tmp[j] == 2 { virus.append([i,j]) }
    }
}

// 완전탐색으로 벽 만들고 bfs
for i in 0..<safe.count {
    for j in i+1..<safe.count {
        for k in j+1..<safe.count {
            var map = map
            
            map[safe[i][0]][safe[i][1]] = 1
            map[safe[j][0]][safe[j][1]] = 1
            map[safe[k][0]][safe[k][1]] = 1
            
            bfs(map)
        }
    }
}

print(result)

func bfs(_ map: [[Int]]) {
    var map = map
    var queue = Queue(queue: virus)
    
    while !queue.isEmpty {
        let now = queue.pop()!
        
        for i in 0..<4 {
            let move = [now[0] + dx[i], now[1] + dy[i]]
            if move[0] < 0 || move[0] >= n || move[1] < 0 || move[1] >= m { continue }
            if map[move[0]][move[1]] == 0 {
                map[move[0]][move[1]] = 2
                queue.push(move)
            }
        }
    }
    
    var safeArea = 0
    for i in 0..<n {
        for area in map[i] {
            if area == 0 { safeArea += 1 }
        }
    }
    result = max(result, safeArea)
}

struct Queue<T> {
    var queue: [T] = []

    var isEmpty: Bool {
        return queue.isEmpty
    }

    mutating func front() -> T? {
        return isEmpty ? nil : queue.first
    }

    mutating func push(_ element: T) {
        queue.append(element)
    }

    mutating func pop() -> T? {
        return isEmpty ? nil : queue.removeFirst()
    }
}
