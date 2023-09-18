import Foundation

// 30023_전구 상태 바꾸기

// 문제
// n개의 전구 중 연속한 세 개의 전구를 선택하고 색을 바꾼다.
// R -> G, G -> B, B -> R
// 최소 몇 번 바꿔야 모두 같은 색이 되는가?

// 풀이
// n-3 -> 완탐 시간 초과
// 그리디

let n = Int(readLine()!)!
let bulbs = readLine()!.map { String($0) }
let change = ["R": "G", "G": "B", "B": "R"]
let start = ["R", "G", "B"]
var result = Int.max

for start in start {
    result = min(result, sol(start, bulbs))
}
print(result == Int.max ? -1 : result)

func sol(_ start: String, _ bulbs: [String]) -> Int {
    var bulbs = bulbs
    var count = 0
    for i in 0..<n-2 {
        while bulbs[i] != start {
            bulbs[i] = change[bulbs[i]]!
            bulbs[i+1] = change[bulbs[i+1]]!
            bulbs[i+2] = change[bulbs[i+2]]!
            count += 1
        }
    }
    for bulb in bulbs {
        if bulb != start { return Int.max }
    }
    return count
}
