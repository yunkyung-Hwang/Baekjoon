/*
 n원 만드는 경우 dp[n] = n-coin[0]원 만드는 경우 + n-coin[1]원 만드는 경우 ... n-coin[n]원 만드는 경우

 ex) 5원 / (1, 2)
 5원 = 5-1원, 5-2원
 4원 = 4-1원, 4-2원
 3원 = 3-1원, 3-2원
 2원 = 2-1원, 2-2원
 1원 = 1-1원
 0원 -> 1
 */

import Foundation

let t = Int(readLine()!)!

for _ in 0..<t {
    let _ = Int(readLine()!)!
    let coins = readLine()!.split(separator: " ").map { Int(String($0))! }
    let m = Int(readLine()!)!
    var dp = [Int](repeating: 0, count: m+1)
    dp[0] = 1
    
    for coin in coins {
        if coin > m { continue }
        for won in coin...m {
            dp[won] += dp[won-coin]
        }
    }
    print(dp[m])
}
