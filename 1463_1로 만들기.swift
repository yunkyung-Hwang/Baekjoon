import Foundation

let n = Int(readLine()!)!
var dp = [Int](repeating: 0, count: 1000001)
dp[1] = 0
dp[2] = 1
dp[3] = 1

if n >= 4 {
    for i in 4...n {
        let tmp1 = dp[i-1]
        let tmp2 = i % 3 == 0 ? dp[i/3] : Int.max
        let tmp3 = i % 2 == 0 ? dp[i/2] : Int.max
        
        dp[i] = min(tmp1, min(tmp2, tmp3)) + 1
    }
}

print(dp[n])
