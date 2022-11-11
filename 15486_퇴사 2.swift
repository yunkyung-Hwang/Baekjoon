import Foundation

let n = Int(readLine()!)!
var dp = [[Int]](repeating: [Int](repeating: 0, count: 2), count: n+1)
var result = 0

for i in 0..<n {
    dp[n-i] = readLine()!.split(separator: " ").map { Int(String($0))! }
}
// reverse 대신 인덱스 바꿔 받음
// dp.reverse()
// dp.insert([0,0], at: 0)

for i in 1...n {
    if i-dp[i][0] >= 0 {
        result = max(result, dp[i][1] + dp[i-dp[i][0]][1])
        dp[i][1] = result
    } else {
        // 틀린 부분
        // ex) 6일째에서 날짜가 넘었더라도 7일째에 상담이 가능하면
        // 6일째에는 0이 아니라 7일째의 값이 들어가야함
        // dp[i][1] = 0
        dp[i][1] = dp[i-1][1]
    }
}

print(result)
