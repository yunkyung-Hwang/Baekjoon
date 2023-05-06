import Foundation

// 2302_극장 좌석

// 문제
// 극장의 좌석은 1~N까지 한 줄로 되어있다.
// 자기 입장권에 쓰여 있는 좌석 번호에 앉아야 하지만 바로 왼쪽이나 오른쪽으로는 옮길 수 있다.
// 단, VIP 회원들은 본인 좌석에만 앉을 수 있다.
// 모든 좌석이 다 팔렸고 VIP 회원들의 좌석이 주어졌을 때 사람들이 좌석에 앉는 서로 다른 방법의 가짓수를 구해라

// 인덱스 주의!!!!
// 시작 기준 -> 마지막 처리 or 인덱스 
// 끝 기준 -> 시작 인덱스 0..<m // m이 0일때 주의

var n = Int(readLine()!)!
let m = Int(readLine()!)!
var vips = [Int](repeating: 0, count: m)
var result = 1

for i in 0..<m {
    vips[i] = Int(readLine()!)!
    result *= solve(i == 0 ? vips[i] - 1 : vips[i] - vips[i-1] - 1)
}

result *= solve(n - (vips.last ?? 0))

print(result)

func solve(_ cnt: Int) -> Int {
    // 해당 숫자의 이전 / 제자리 / 다음 배치 dp
    if cnt < 2 { return 1 }
    
    var dp = [[Int]](repeating: [Int](repeating: 0, count: 3), count: cnt)
    dp[dp.count-1][0] = 1
    dp[dp.count-1][1] = 1
    dp[dp.count-1][2] = 0
    
    var idx = dp.count - 2
    
    while idx >= 0 {
        dp[idx][0] = dp[idx+1][1] + dp[idx+1][2]
        dp[idx][1] = dp[idx+1][1] + dp[idx+1][2]
        dp[idx][2] = dp[idx+1][0]
        
        idx -= 1
    }
    
    return dp[0][1] + dp[0][2]
}
