// 1987_알파벳

// 문제
// 알파벳 대문자로 채워진 RxC칸 표
// (1,1)에는 말이 놓여있다.
// 새로 이동한 칸에는 지금까지 지나온 알파벳과는 달라야한다.
// 말이 최대한 몇칸 움직일 수 있는지 구하기

// 풀이 1) dfs
// dfs는 맞는데 시간초과
// 비트마스킹 써야함

let dx = [0, 0, -1, 1]
let dy = [-1, 1, 0, 0]
typealias Point = (x: Int, y: Int)

let rc = readLine()!.split(separator: " ").map { Int(String($0))! }
let (r, c) = (rc[0], rc[1])
var map = [[Int]](repeating: [Int](repeating: 0, count: c), count: r)
for i in 0..<r {
    map[i] = readLine()!.map { Int($0.asciiValue! - Character("A").asciiValue!) }
}
/// A~Z
var visited = [Bool](repeating: false, count: 26)
visited[map[0][0]] = true

var result = 1
dfs((0, 0), 1)
print(result)

func dfs(_ node: Point, _ count: Int) {
    result = max(result, count)
    
    for i in 0..<4 {
        let px = node.x + dx[i]
        let py = node.y + dy[i]
        if 0..<r ~= px && 0..<c ~= py && !visited[map[px][py]] {
            visited[map[px][py]] = true
            dfs((px, py), count + 1)
            visited[map[px][py]] = false
        }
    }
}
