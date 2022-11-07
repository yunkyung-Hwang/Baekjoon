import Foundation

// 하나 작은 제곱수 + 1
//dp[1] = 1
//dp[2] = dp[1] + dp[1]
//dp[3] = dp[1] + dp[2]
//dp[4] = 1
//dp[5] = dp[1] + dp[4]
//dp[6] = dp[1] + dp[5]
//        dp[4] + dp[2]
//dp[7] = dp[1] + dp[6]
//        dp[4] + dp[3]
//...
//dp[18] = dp[1] + dp[17]
//         dp[4] + dp[14]
//         dp[9] + dp[9]

var n = Int(readLine()!)!
var dp = [Int](repeating: 0, count: 50001)

var num = 0
for i in 1...n {
    if i == (num + 1) * (num + 1) {
        dp[i] = 1
        num += 1
    } else {
        var tmp = 1
        dp[i] = dp[num*num] + dp[i - num*num]
        while tmp < num {
            dp[i] = min(dp[i], dp[tmp*tmp] + dp[i - tmp*tmp])
            tmp += 1
        }
    }
}

print(dp[n])
