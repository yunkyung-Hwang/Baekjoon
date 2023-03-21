import Foundation

// 1937_욕심쟁이 판다

// 문제
// n x n 대나무숲
// 상 하 좌 우로 이동하며 대나무를 먹는다.
// 먹은 자리가 대나무가 더 많이 있는 곳으로 이동한다.
// 판다를 최대한 많은 칸으로 이동시켜야함
// 최대한 많은 칸으로 이동했을때 이동 칸 수 구하기

// 풀이
// 1520_내리막길이랑 비슷한 유형
// 해당 지점부터 갈 수 있는 경우를 dp로 저장하기
// dfs중 이미 dp값이 갱신된 지점(방문한 지점)에 들어가면 탐색 종료하고 해당 값 반환
// 내리막길이랑 다르게 모든 시작점에서 판단하고 한 번 방문한 지점은 초기화시키지 않음

// 시간복잡도
// 각 칸에서 출발해서 dfs로 모든 지점 한 번씩 확인
// O(n^2) * dfs..?

let n = Int(readLine()!)!
var bamboo = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
var dp = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
let dx = [-1, 1, 0, 0]
let dy = [0, 0, -1, 1]
for i in 0..<n {
    bamboo[i] = readLine()!.split(separator: " ").map { Int(String($0))! }
}
var result = 0

for i in 0..<n {
    for j in 0..<n {
        result = max(dfs(i, j), result)
    }
}

print(result)

func dfs(_ x: Int, _ y: Int) -> Int {
    if dp[x][y] != 0 { return dp[x][y] }
    dp[x][y] = 1
    
    for i in 0..<4 {
        let px = x + dx[i]
        let py = y + dy[i]
        
        if 0..<n ~= px && 0..<n ~= py && bamboo[px][py] > bamboo[x][y] {
            dp[x][y] = max(dp[x][y], dfs(px, py) + 1)
        }
    }
    return dp[x][y]
}
