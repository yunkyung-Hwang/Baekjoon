import Foundation

// 2631_줄세우기

// 문제
// N명의 아이들이 번호 순서대로 걸어가다가 섞였다.
// 아이들을 최소로 움직여 다시 정렬하려한다.
// 움직이는 아이의 최소 수를 구해라.
// 아이들 수 200 이하

// 풀이-가장 큰 증가하는 부분수열 찾기
// 증가하는 부분수열의 최대값 찾아서 전체 크기에서 빼기
// 키: 3 7 5 2 6 1 4
// dp: 3 1 2 2 1 2 1

let n = Int(readLine()!)!
var tall = [Int](repeating: 0, count: n)
var dp = [Int](repeating: 1, count: n)
var result = 0
for i in 0..<n {
    tall[i] = Int(readLine()!)!
}

for i in 0..<n {
    let idx = n-1-i
    for j in idx+1..<n {
        if tall[idx] < tall[j] {
            dp[idx] = max(dp[idx], dp[j] + 1)
        }
    }
    result = max(result, dp[idx])
}

print(n-result)
