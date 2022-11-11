import Foundation

let n = Int(readLine()!)!
var dp = [[Int]](repeating: [Int](repeating: 0, count: 2), count: n)
var result = 0

for i in 0..<n {
    dp[i] = readLine()!.split(separator: " ").map { Int(String($0))! }
}
dp.reverse()
dp.insert([0,0], at: 0)

for i in 1...n {
    if i-dp[i][0] >= 0 {
        result = max(result, dp[i][1] + dp[i-dp[i][0]][1])
        dp[i][1] = result
    } else {
        dp[i][1] = 0
    }
}

print(result)
