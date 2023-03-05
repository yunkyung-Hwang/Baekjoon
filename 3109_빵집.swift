import Foundation

// 3109 빵집

// 문제
// 근처 빵집의 가스 훔치기 (첫째열과 마지막 열을 잇기)
// 빵집을 연결하는 파이프 설치 / 칸마다 하나씩만 설치 가능 / 건물 존재 가능
// 파이프는 대각선으로도 설치 가능
// 가스를 되도록 많이 훔치기 위해 여러 길 설치
// 최대값 구하기

// 풀이
// 행 수만큼 dfs
// 오른쪽으로 이동하면서 세 가지 위치 중 갈 수 있는 곳이 없으면 백
// 끝까지 파이프를 연결할 수 있다면 true 없다면 false 체크가 필요하다

// 헷갈렸던 부분!!
// 그냥 맨 위에서부터 파이프 놓는게 최대임
// 파이프 놓으면 끝임 방문 처리 초기화 안해줘도 됨
// 쉬운걸 꼬아서 더 어렵게 생각했네..

// 시간 복잡도
// O(RC)

let rc = readLine()!.split(separator: " ").map { Int(String($0))! }
let (r, c) = (rc[0], rc[1])
var graph = [[String]](repeating: [String](repeating: ".", count: c), count: r)
let dir = [-1, 0, 1]
var result = 0

for i in 0..<r {
    graph[i] = readLine()!.map { String($0) }
}

for i in 0..<r {
    _ = dfs(i, 0)
}

print(result)

func dfs(_ x: Int, _ y: Int) -> Bool {
    if y >= c - 1 {
        result += 1
        return true
    }
    
    graph[x][y] = "x"
    
    for i in 0..<3 {
        let px = x + dir[i]
        let py = y + 1
        
        if 0..<r ~= px && py < c && graph[px][py] != "x" {
            if dfs(px, py) { return true }
        }
    }
    
    return false
}
