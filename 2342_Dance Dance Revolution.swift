// 풀이 3) DP + 메모이제이션
import Foundation

let move = readLine()!.split(separator: " ").map { Int(String($0))! }
var dp = [[[Int]]](repeating: [[Int]](repeating: [Int](repeating: 0, count: 100001), count: 5), count: 5)
print(solve(0,0,0))

func solve(_ l: Int, _ r: Int, _ n: Int) -> Int {
    if n == move.count - 1 { return 0 }
    if dp[l][r][n] != 0 { return dp[l][r][n] }
    dp[l][r][n] = min(solve(move[n], r, n+1) + moveCost(l, move[n]),
                      solve(l, move[n], n+1) + moveCost(r, move[n]))
    return dp[l][r][n]
}

func moveCost(_ from:Int, _ to: Int) -> Int {
    if from == to {
        return 1
    } else if from == 0 {
        return 2
    } else if abs(from - to) % 2 == 1 {
        return 3
    } else {
        return 4
    }
}

// 풀이 2) DP (시간초과)
// import Foundation

// let move = readLine()!.split(separator: " ").map { Int(String($0))! }

// print(solve(0,0,0))

// func solve(_ l: Int, _ r: Int, _ n: Int) -> Int {
//     if n == move.count - 1 { return 0 }
//     return min(solve(move[n], r, n+1) + moveCost(l, move[n]),
//                solve(l, move[n], n+1) + moveCost(r, move[n]))
// }

// func moveCost(_ from:Int, _ to: Int) -> Int {
//     if from == to {
//         return 1
//     } else if from == 0 {
//         return 2
//     } else if abs(from - to) % 2 == 1 {
//         return 3
//     } else {
//         return 4
//     }
// }

// 풀이 1) 그리디 (틀렸습니다)
// import Foundation

// let move = readLine()!.split(separator: " ").map { Int(String($0))! }
// var l = 0   // 왼발
// var r = 0   // 오른발
// var result = 0

// for move in move {
//     if move == 0 { break }
    
//     if move == l {
//         l = move
//         result += 1
//     } else if move == r {
//         r = move
//         result += 1
//     } else if l == 0 {
//         l = move
//         result += 2
//     } else if r == 0 {
//         r = move
//         result += 2
//     } else if abs(move - l) % 2 == 1 {
//         l = move
//         result += 3
//     } else if abs(move - r) % 2 == 1 {
//         r = move
//         result += 3
//     } else if abs(move - l) % 2 == 0 {
//         l = move
//         result += 4
//     } else if abs(move - r) % 2 == 0 {
//         r = move
//         result += 4
//     }
// }
// print(result)
