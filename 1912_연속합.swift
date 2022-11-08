import Foundation

let n = Int(readLine()!)!
let nums = readLine()!.split(separator: " ").map { Int($0)! }
var sum = [Int](repeating: 0, count: n)
sum[0] = nums[0]

var maxx = nums.max()!
for i in 1..<n {
    sum[i] = max(nums[i] + sum[i-1], nums[i])
    maxx = max(sum[i], maxx)
}
print(maxx)
