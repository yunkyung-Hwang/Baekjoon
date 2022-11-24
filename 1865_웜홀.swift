// 풀이 1) 플로이드 워셜
import Foundation

let t = Int(readLine()!)!
for _ in 0..<t{
    let nmw = readLine()!.split(separator: " ").map { Int(String($0))! }
    let n = nmw[0], m = nmw[1], w = nmw[2]
    let maxx = Int(1e9)
    var graph = [[Int]](repeating: [Int](repeating: maxx, count: n), count: n)
    
    for _ in 0..<m {
        let input = readLine()!.split(separator: " ").map { Int(String($0))! }
        if graph[input[0]-1][input[1]-1] < input[2] { continue }
        graph[input[0]-1][input[1]-1] = input[2]
        graph[input[1]-1][input[0]-1] = input[2]
    }
    
    for _ in 0..<w {
        let input = readLine()!.split(separator: " ").map { Int(String($0))! }
        graph[input[0]-1][input[1]-1] = input[2] * -1
    }
    
    var result = false
    floyd()
    
    print(result ? "YES" : "NO")
    
    func floyd() {
        for tmp in 0..<n {
            for i in 0..<n {
                for j in 0..<n {
                    if graph[i][j] > graph[i][tmp] + graph[tmp][j] {
                        graph[i][j] = graph[i][tmp] + graph[tmp][j]
                    }
                    if i == j && graph[i][i] < 0 {
                        result = true
                        return
                    }
                }
            }
        }
    }
}
