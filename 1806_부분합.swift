import Foundation

// 5달만에 퇴화함 이건 왜 틀릴까
let ns = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, s) = (ns[0], ns[1])
let nums = readLine()!.split(separator: " ").map { Int(String($0))! }
var dp = nums
for i in 1..<n {
    dp[i] += dp[i-1]
}

var sp = 0, ep = 1, result = Int.max
while sp < n && ep < n {
    if dp[ep] - dp[sp] >= s {
        result = min(result, ep - sp)
        sp += 1
    } else {
        ep += 1
    }
}
print(result == Int.max ? 0 : result)

// let nm = readLine()!.split(separator: " ").map { Int($0)! }
// let n = nm[0]
// let m = nm[1]
// var nums = readLine()!.split(separator: " ").map { Int($0)! }
// nums.insert(0, at: 0)

// for i in 1...n {
//    nums[i] += nums[i-1]
// }

// var p1 = 0
// var p2 = 1
// var result = Int.max

// while p1 <= n && p2 <= n {
//    if nums[p2] - nums[p1] < m {
//        p2 += 1
//    } else {
//        result = min(result, p2 - p1)
//        p1 += 1
//    }
// }

// print(result == Int.max ? 0 : result)
