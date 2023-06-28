// 9095_1, 2, 3 더하기

// 풀이
// dp
// 점화식 찾기

// 3까지 제한이 있어서 3개의 숫자를 더하는 것
// 1, 2 더하기였으면 두개

var dp = [Int](repeating: 0, count: 11)
dp[0] = 1
dp[1] = 2
dp[2] = 4
for i in 3..<11 {
    dp[i] = dp[i-1] + dp[i-2] + dp[i-3]
}

let t = Int(readLine()!)!
for _ in 0..<t {
    let n = Int(readLine()!)!
    print(dp[n-1])
}
