import Foundation

let nm = readLine()!.split(separator: " ").map { Int($0)! }
let n = nm[0]
let m = nm[1]
var a = [[Int]](repeating: [Int](repeating: 0, count: m), count: n)
var b = [[Int]](repeating: [Int](repeating: 0, count: m), count: n)
var isSame = [[Bool]](repeating: [Bool](repeating: false, count: m), count: n)
var result = 0

for i in 0..<n {
    a[i] = readLine()!.map { Int(String($0))! }
}

for i in 0..<n {
    b[i] = readLine()!.map { Int(String($0))! }
}

if a == b {
    print(0)
    exit(0)
}

if (n < 3 || m < 3) {
    print(-1)
    exit(0)
}

for i in 0..<n {
    for j in 0..<m {
        isSame[i][j] = a[i][j] == b[i][j]
    }
}

for i in 0..<n-2 {
    for j in 0..<m-2 {
        if isSame[i][j] { continue }
        for k in 0..<3 {
            for l in 0..<3 {
                isSame[i+k][j+l].toggle()
            }
        }
        result += 1
    }
}

print(checkPossibility() ? result : -1)

func checkPossibility() -> Bool {
    for i in 0..<n {
        for j in 0..<m {
            if !isSame[i][j] { return false }
        }
    }
    return true
}
