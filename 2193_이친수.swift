import Foundation

// 2193_이친수

// 문제
// 이친수: 이진수 중 아래 조건을 만족하는 수
// - 0으로 시작하지 않는다
// - 1이 두 번 연속으로 나타나지 않는다
// n자리 이친수의 개수 구하기

// 풀이
// n <= 90
// 2^90할 수 없으니 dp 같은데
// 첫 두자리 10으로 고정

// 22m

let n = Int(readLine()!)!
var result = 0

if n == 1 {
    result = 1
} else {
    // dp[i] = i번째 칸의 [1의 개수, 0의 개수]
    var dp = [[Int]](repeating: [0, 0], count: n)
    dp[0] = [1, 0]

    // dp 처리
    for i in 1..<n {
        dp[i][0] = dp[i-1][1]
        dp[i][1] = dp[i-1][0] + dp[i-1][1]
    }

    result = dp[n-1][0] + dp[n-1][1]
}
print(result)
