// 풀이 2)
// Set 사용
// Set의 contains 메서드의 경우 O(1)

import Foundation

let nm = readLine()!.split(separator: " ").map { Int($0)! }
let n = nm[0]
let m = nm[1]
var s = Set<String>()
var result = 0

for _ in 0..<n {
    s.insert(readLine()!)
}

for _ in 0..<m {
    if s.contains(readLine()!) { result += 1 }
}

print(result)


// 풀이 1)
// 배열 사용 시간초과
// import Foundation

// let nm = readLine()!.split(separator: " ").map { Int($0)! }
// let n = nm[0]
// let m = nm[1]
// var s = [String](repeating: "", count: n)
// var input = [String](repeating: "", count: m)
// var result = 0

// for i in 0..<n {
//     s[i] = readLine()!
// }

// for i in 0..<m {
//     input[i] = readLine()!
//     if s.contains(input[i]) { result += 1 }
// }

// print(result)
