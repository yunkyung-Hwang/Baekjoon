import Foundation

// 11726_2×n 타일링

let n = Int(readLine()!)!
if n == 1 {
    print(1)
    exit(0)
}
var dp = [Int](repeating: 0, count: n)
dp[0] = 1
dp[1] = 2

if n > 2 {
    for i in 2..<n {
        dp[i] = (dp[i-1] + dp[i-2]) % 10007
    }
}

print(dp[n-1])
