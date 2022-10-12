// 풀이 2) BFS
import Foundation

let t = Int(readLine()!)!
let dx = [-1, 0, 1, 0]
let dy = [0, 1, 0, -1]

for _ in 0..<t{
    let mnk = readLine()!.split(separator: " ").map { Int($0)! }
    let m = mnk[0]
    let n = mnk[1]
    let k = mnk[2]
    var field = [[Bool]](repeating: [Bool](repeating: false, count: m), count: n)
    for _ in 0..<k {
        let cab = readLine()!.split(separator: " ").map { Int($0)! }
        field[cab[1]][cab[0]] = true
    }
    var result = 0
    
    for i in 0..<n {
        for j in 0..<m {
            if field[i][j] {
                bfs(r: i, c: j)
                result += 1
            }
        }
    }
    
    print(result)
    
    
    func bfs(r: Int, c: Int) {
        var q = [[Int]]()
        q.append([r, c])
        field[r][c] = false
        
        while !q.isEmpty {
            let node = q.removeFirst()
            
            for i in 0..<4 {
                let px = node[0] + dx[i]
                let py = node[1] + dy[i]
                
                if px < 0 || py < 0 || px >= n || py >= m || !field[px][py] {
                    continue
                }
                field[px][py] = false
                q.append([px, py])
            }
        }
    }
}


// 풀이 1) DFS
// import Foundation

// let t = Int(readLine()!)!
// let dx = [-1, 0, 1, 0]
// let dy = [0, 1, 0, -1]

// for _ in 0..<t{
//     let mnk = readLine()!.split(separator: " ").map { Int($0)! }
//     let m = mnk[0]
//     let n = mnk[1]
//     let k = mnk[2]
//     var field = [[Bool]](repeating: [Bool](repeating: false, count: m), count: n)
//     for _ in 0..<k {
//         let cab = readLine()!.split(separator: " ").map { Int($0)! }
//         field[cab[1]][cab[0]] = true
//     }
//     var result = 0
    
//     for i in 0..<n {
//         for j in 0..<m {
//             if field[i][j] {
//                 dfs(r: i, c: j)
//                 result += 1
//             }
//         }
//     }
    
//     print(result)
    
//     func dfs(r: Int, c: Int) {
//         for i in 0..<4 {
//             let px = r + dx[i]
//             let py = c + dy[i]
            
//             if px < 0 || py < 0 || px >= n || py >= m || !field[px][py] {
//                 continue
//             }
//             field[px][py] = false
//             dfs(r: px, c: py)
//         }
//     }
// }
