import Foundation

let nk = readLine()!.split(separator: " ").map{ Int($0)! }
let n = nk[0]
var k = nk[1]
var coin = [Int](repeating: 0, count: n)
var result = 0

for i in 0..<n {
    coin[i] = Int(readLine()!)!
}

var idx = n - 1
while true {
    while coin[idx] <= k {
        k -= coin[idx]
        result += 1
    }
    if k == 0 { break }
    idx -= 1
}

print(result)
