import Foundation

// 1697_숨바꼭질

// 문제
// 수빈이는 n에, 동생은 k에 있다. <= 100000(십만)
// 수빈이는 1칸씩 걷거나 2*(현재위치)의 위치로 순간이동 할 수 있다.
// 동생을 찾을 수 있는 가장 빠른 시간 구하기

// 풀이
// bfs
// 단, 종료 조건 및 범위 확인
// visited가 int 범위이기 때문에
// 음수 조건 안달면 런타임 & 범위 조건 안달면 시간초과

let nk = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, k) = (nk[0], nk[1])
var queue = [(p: n, count: 0)]
var qIdx = 0
let maxx = 100001
var visited = [Bool](repeating: false, count: maxx)
visited[n] = true

n == k ? print(0) : bfs()

func bfs() {
    while qIdx < queue.count {
        let node = queue[qIdx]
        qIdx += 1
        
        for num in [node.p + 1, node.p - 1, node.p * 2] {
            if num == k {
                print(node.count + 1)
                return
            }
            if 0..<maxx ~= num && !visited[num] {
                visited[num] = true
                queue.append((num, node.count + 1))
            }
        }
    }
}
