import Foundation

let nk = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = nk[0], k = nk[1]
var visit = [Int](repeating: 0, count: 100001)
var result = 0
let nums = readLine()!.split(separator: " ").map { Int(String($0))! }

var s = 0, e = 0
while e < n {
    if visit[nums[e]] < k {
        visit[nums[e]] += 1
        e += 1
    } else {
        visit[nums[s]] -= 1
        s += 1
    }
    result = max(result, e - s)
}


print(result)
