import Foundation

let nm = readLine()!.split(separator: " ").map { Int($0)! }
let n = nm[0]
let m = nm[1]
var nums = readLine()!.split(separator: " ").map { Int($0)! }
nums.insert(0, at: 0)

for i in 1...n {
   nums[i] += nums[i-1]
}

var p1 = 0
var p2 = 1
var result = Int.max

while p1 <= n && p2 <= n {
   if nums[p2] - nums[p1] < m {
       p2 += 1
   } else {
       result = min(result, p2 - p1)
       p1 += 1
   }
}

print(result == Int.max ? 0 : result)
