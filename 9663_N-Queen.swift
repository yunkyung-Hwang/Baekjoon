// 시간 초과

import Foundation

let n = Int(readLine()!)!
var result = 0
var col = [Int](repeating: 0, count: 15)

nQueen(index: 0)
print(result)

func check(index: Int) -> Bool {
    for i in 0..<index {
        if col[index] == col[i] || abs(col[index] - col[i]) == index - i { return false }
    }
    return true
}

func nQueen(index: Int) {
    if index == n {
        result += 1
    } else {
        for i in 0..<n {
            col[index] = i
            if check(index: index) {
                nQueen(index: index + 1)
            }
        }
    }
}
