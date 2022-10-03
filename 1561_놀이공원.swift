import Foundation

let nm = readLine()!.split(separator: " ").map { Int($0)! }
let n = nm[0]
let m = nm[1]
let times = readLine()!.split(separator: " ").map { Int($0)! }
var low = 0
var high = n
var mid = 0
while low <= high {
    mid = (low + high) / 2
    
    if check(mid) < n - m {
        low = mid + 1
    } else {
        high = mid - 1
    }
}

var lastTime = low
var child = check(lastTime)
var result = 0

while child < n {
    lastTime += (lastTime == 0) ? 0 : 1
    for i in 0..<times.count {
        if child >= n { break }
        if lastTime % times[i] == 0 {
            child += 1
            result = i + 1
        }
    }
}

print(result)

func check(_ minute: Int) -> Int {
    var cnt = 0
    if minute == 0 { return 0 }
    for time in times {
        cnt += minute / time + 1
    }
    
    return cnt
}
