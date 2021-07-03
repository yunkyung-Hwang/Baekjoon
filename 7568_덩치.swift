import Foundation

let n = Int(readLine()!)!
var profile : [[Int]] = Array(repeating: Array(repeating: 0, count: 2), count: n)
var rank = [Int](repeating: 1, count: n)

for i in 0..<n {
    profile[i] = (readLine()!.split(separator: " ")).map{ Int($0)! }    // 이게 되네
}

for i in 0..<n {        // i번째 사람이
    for j in 0..<n {    // 나머지 사람과 모두 비교
        if (profile[i][0] < profile[j][0]) && (profile[i][1] < profile[j][1]) {
            rank[i] += 1
        }
    }
}
for i in 0..<n {
    print(rank[i], terminator: " ")
}
