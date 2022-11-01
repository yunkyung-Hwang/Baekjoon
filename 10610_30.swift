import Foundation

let n = Array(readLine()!)
let nums = n.sorted(by: >).map { Int(String($0))! }

var sum = 0
for num in nums {
    sum += num
}

print(sum % 3 == 0 && nums.contains(0) ? nums.map { String($0) }.joined() : -1)
