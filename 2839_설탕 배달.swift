// 풀이 2) DP
// i kg에 대한 답 -> i-3 or i-5에 대한 답 중 작은것 + 1
// dp[i] = min(dp[i-3] + 1, dp[i-5] + 1)

import Foundation

var n = Int(readLine()!)!
var dp = [Int](repeating: 0, count: 5001)

dp[3] = 1
dp[5] = 1

if n >= 6 {
    for i in 6...n {
        if dp[i-3] != 0 {
            dp[i] = dp[i-3]+1
        }
        if dp[i-5] != 0 {
            dp[i] = dp[i] != 0 ? min(dp[i], dp[i-5]+1) : dp[i-5]+1
        }
    }
}

print(dp[n] == 0 ? -1 : dp[n])

// 풀이 1) 그리디
// import Foundation

// var n = Int(readLine()!)!
// var result = 0

// while n >= 0 {
//     if n % 5 == 0 {
//         result += n / 5
//         n = 0
//         break
//     }
//     n -= 3
//     result += 1
// }

// print(n == 0 ? result : -1)
