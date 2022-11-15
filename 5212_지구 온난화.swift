import Foundation

let rc = readLine()!.split(separator: " ").map { Int(String($0))! }
let r = rc[0]
let c = rc[1]
var map = [[Bool]](repeating: [Bool](repeating: false, count: c), count: r)
var newMap = [[Bool]](repeating: [Bool](repeating: false, count: c), count: r)
let dx = [-1, 0, 1, 0]
let dy = [0, -1, 0, 1]
var minP = [r-1, c-1]
var maxP = [0, 0]

for i in 0..<r {
    let tmp = Array(readLine()!)
    for j in 0..<c {
        map[i][j] = tmp[j] == "X"
    }
}

for i in 0..<r {
    for j in 0..<c {
        var cnt = 0
        if !map[i][j] { continue }
        for d in 0..<4 {
            let px = i + dx[d]
            let py = j + dy[d]
            if px < 0 || py < 0 || px >= r || py >= c || !map[px][py] {
                cnt += 1
            }
        }
        newMap[i][j] = cnt < 3
        if newMap[i][j] {
            minP[0] = min(minP[0], i)
            minP[1] = min(minP[1], j)
            maxP[0] = max(maxP[0], i)
            maxP[1] = max(maxP[1], j)
        }
    }
}

for i in minP[0]...maxP[0] {
    for j in minP[1]...maxP[1] {
        print(newMap[i][j] ? "X" : ".", terminator: "")
    }
    print()
}
