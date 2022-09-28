import Foundation

let nm = readLine()!.split(separator: " ").map { Int($0)! }
let n = nm[0]
let m = nm[1]
var trees = readLine()!.split(separator: " ").map { Int($0)! }

var low = 1
var high = trees.max()!
var result = 0
var sum: CLong = 0

while low <= high {
    sum = 0
    let mid = (low + high) / 2
    
    for tree in trees {
        sum += tree >= mid ? tree - mid : 0
    }
    
    if sum >= m {
        low = mid + 1
        result = mid
    } else {
        high = mid - 1
    }
}

print(result)
