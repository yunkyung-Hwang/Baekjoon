import Foundation

let nm = readLine()!.split(separator: " ").map { Int($0)! }
let n = nm[0]
let m = nm[1]
var length = readLine()!.split(separator: " ").map { Int($0)! }
var result = Int.max

var low = 1
var high = 0
for length in length {
    high += length
}

while low <= high {
    let mid = (low + high) / 2
    var sum = 0
    var size = 0
    var cnt = 1
    
    for length in length {
        if sum + length <= mid {
            sum += length
        } else {
            size = max(size, sum)
            sum = length
            cnt += 1
        }
    }
    size = max(size, sum)
    
    if cnt > m {
        low = mid + 1
    } else {
        high = mid - 1
        result = min(result, size)
    }
}

print(result)
