// 구글링

import Foundation

let n = Int(readLine()!)!
var a = [[Int]](repeating: [Int](repeating: 0, count: 2), count: n)
for i in 0..<n {
    a[i][0] = Int(readLine()!)!
    a[i][1] = i
}

a.sort(by: { $0[0] < $1[0] })
var result = 0
for i in 0..<a.count {
    result = max(result, a[i][1] - i)
}

print(result + 1)
