import Foundation

// 23083_꿀벌 승연이

// 문제
// 벌집은 N행 M열 6각형 모양
// 짝수 열의 n행은 홀수열의 n행보다 한 칸 내려가있다.
// 육각형의 하나의 변을 공유하고 있으면 인접하다고 본다.
// 인접한 칸에서 아래, 오른쪽 아래, 오른쪽 위 칸으로만 이동할 수 있다.
// 구멍이 있는 칸으로는 이동할 수 없다.
// 1행 1열에서 N행 M열까지 이동하는 경로의 개수를 구해라

// 풀이
// 벌집 만들고 dp

// 벌집
// : 벌집을 대각선으로 뒤집어서 m줄, n+m/2열 배열 만들고
// 빈칸 먼저 false 만들어주고
// 각 줄에 맞는 개수만큼의 false 배열을 insert at 0

let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, m) = (nm[0], nm[1])
let nn = n + m / 2
let k = Int(readLine()!)!
var honeycomb = [[Bool]](repeating: [Bool](repeating: true, count: nn), count: m)
let div = 1000000007

// 빈 구멍 처리
for _ in 0..<k {
    let hole = readLine()!.split(separator: " ").map { Int(String($0))! }
    honeycomb[hole[1]-1][hole[0]-1] = false
}
for i in 0..<m {
    for j in n..<nn {
        honeycomb[i][j] = false
    }
    honeycomb[i].insert(contentsOf: [Bool](repeating: false, count: (i + 1) / 2), at: 0)
}

var dp = [[Int]](repeating: [Int](repeating: 0, count: nn), count: m)
dp[0][0] = 1
// 오, 아, 오아
let dx = [0, 1, 1]
let dy = [1, 0, 1]
for i in 0..<m {
    for j in 0..<nn {
        for t in 0..<3 {
            let px = i + dx[t]
            let py = j + dy[t]
            if 0..<m ~= px && 0..<nn ~= py && honeycomb[px][py] {
                dp[px][py] = (dp[px][py] + dp[i][j]) % div
            }
        }
    }
}

print(dp[m-1][nn-1])
