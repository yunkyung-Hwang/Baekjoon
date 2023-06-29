// 1149_RGB 거리

// 문제
// 인접한 집은 색이 달라야한다.
// 각 집을 칠하는 rgb 비용이 각각 다를때 조건을 만족하는 최소비용 구하기

// 풀이
// 1) 최소비용 기준 정렬해서 -> 색칠 비용이 동일할 경우 꼬임

// 2) 2차원 dp
// 각 색을 선택했을때의 최소값 저장
// dp[0] = price[0]
// dp[i] = [min(dp[i-1][1], dp[i-1][2]) + price[i][0],
//          min(dp[i-1][0], dp[i-1][2]) + price[i][1],
//          min(dp[i-1][0], dp[i-1][1]) + price[i][2]]

let n = Int(readLine()!)!
var price = [[Int]](repeating: [Int](repeating: 0, count: 3), count: n)
price[0] = readLine()!.split(separator: " ").map { Int(String($0))! }
for i in 1..<n {
    price[i] = readLine()!.split(separator: " ").map { Int(String($0))! }
    price[i] = [min(price[i-1][1], price[i-1][2]) + price[i][0],
                min(price[i-1][0], price[i-1][2]) + price[i][1],
                min(price[i-1][0], price[i-1][1]) + price[i][2]]
}
print(price.last!.min()!)
