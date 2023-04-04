import Foundation

// 2186_문자판

// 문제
// NxM에 대문자가 하나씩 적혀있다.
// 아무 한 칸을 시작으로 움지깅면서 그 칸에 적혀있는 문자들을 차례대로 모으면 하나의 단어를 만들 수 있다.
// 인접한 방향으로 이동할 수 있으며 K개의 칸을 이동할 수 있다.
// 반드시 한 칸 이상 이동을 해야하고 같은 자리에 머무를 수 없다.
// 만들 수 있는 영단어가 총 몇개인지 알아내는 프로그램을 작성하세요
// 문자판, K, 영단어가 주어졌을 때 해당 영단어를 만들 수 있는 경로가 총 몇개 존재하는지 알아내는 프로그램을 작성하시오

// 풀이) dp
// 1520_내리막길1, 1937_욕심쟁이 판다와 유사한 문제
// 인접 문자 뿐만 아니라 k범위에 있는 문자 모두에 접근할 수 있으니
// 3차원 배열을 만들어서 각 칸에 i번째로 도착했을때 이동 경로를 저장해두기
// 시작문자를 만날때마다 탐색 실행
// 해당 지점의 값이 -1이 아니라면 탐색 계속

// 방문과 초기화를 한 번에 해 줄때 주의하기 -> 초기화 안해서 무한루프 런타임에러 발생가능
// 종료조건 확인
// 가능한 경우 재귀를 들어가느냐 들어가서 종료조건으로 확인하느냐 잘 봐주기

let nmk = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, m, k) = (nmk[0], nmk[1], nmk[2])
var board = [[String]](repeating: [String](repeating: "", count: m), count: n)
for i in 0..<n {
    board[i] = readLine()!.map { String($0) }
}
let keyword = readLine()!.map{ String($0) }
var dp = [[[Int]]](repeating: [[Int]](repeating: [Int](repeating: -1, count: keyword.count), count: m), count: n)
var result = 0
let dx = [0, 0, -1, 1]
let dy = [-1, 1, 0, 0]

for i in 0..<n {
    for j in 0..<m {
        if board[i][j] == keyword[0] {
            result += dfs(x: i, y: j, depth: 0)
        }
    }
}

print(result)

func dfs(x: Int, y: Int, depth: Int) -> Int {
    if depth >= keyword.count - 1 { return 1 }
    if dp[x][y][depth] != -1 { return dp[x][y][depth] }
    
    dp[x][y][depth] = 0
    for i in 0..<4 {
        for j in 1...k {
            let px = x + dx[i] * j
            let py = y + dy[i] * j
            
            if 0..<n ~= px && 0..<m ~= py && board[px][py] == keyword[depth + 1] {
                dp[x][y][depth] += dfs(x: px, y: py, depth: depth + 1)
            }
        }
    }
    
    return dp[x][y][depth]
}
