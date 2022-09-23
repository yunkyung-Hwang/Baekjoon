import Foundation

let n = CLong(readLine()!)!
var cards = [Int](repeating: 0, count: n)
var firstIdx = 0
var maxCnt = 0
var result = 0

for i in 0..<n {
    cards[i] = CLong(readLine()!)!
}

cards.sort()

result = cards[0]
for i in 1..<n {
    if cards[i] != cards[i-1] {
        if maxCnt < i - firstIdx {
            maxCnt = i - firstIdx
            result = cards[i - 1]
        }
        firstIdx = i
    } else if (i == n - 1) && (maxCnt < n - firstIdx) {
        result = cards[i]
    }
}

print(result)
