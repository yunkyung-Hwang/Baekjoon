import Foundation

let rc = readLine()!.split(separator: " ").map { Int($0)! }
let r = rc[0]
let c = rc[1]
var pasture = [[String]](repeating: [String](repeating: ".", count: c), count: r)
var result = 1
let dx = [-1, 0, 1, 0]
let dy = [0, 1, 0, -1]

for i in 0..<r {
    let arr = readLine()!.map { String($0) }
    pasture[i] = Array(arr)
}

for i in 0..<r {
    for j in 0..<c {
        if pasture[i][j] == "W" {
            if !check(x: i, y: j) {
                print(0)
                exit(0)
            }
        }
    }
}

print(result)
for pasture in pasture {
    print(pasture.joined())
}

func check(x: Int, y: Int) -> Bool {
    for i in 0..<4 {
        let px = x + dx[i]
        let py = y + dy[i]
        
        if px < 0 || py < 0 || px >= r || py >= c { continue }
        if pasture[px][py] == "S" { return false }
        else if pasture[px][py] == "." {
            pasture[px][py] = "D"
        }
    }
    return true
}
