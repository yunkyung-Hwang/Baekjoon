import Foundation

let kn = readLine()!.split(separator: " ").map { Int($0)! }
let k = kn[0]
let n = kn[1]
var lines = [Int](repeating: 0, count: k)
var result = 0
for i in 0..<k {
    lines[i] = Int(readLine()!)!
}

var high = lines.max()!
var low = 1

while low <= high {
    let mid = (low + high) / 2
    var cnt = 0
    
    for line in lines {
        cnt += line / mid
    }
    
    if cnt >= n {
        result = max(result, mid)
        low = mid + 1
    } else {
        high = mid - 1
    }
}
print(result)
