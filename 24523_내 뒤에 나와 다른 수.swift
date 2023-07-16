import Foundation

// 24523_내 뒤에 나와 다른 수

// 문제
// i번째 수의 뒤에 있는 수 중 N[i]와 다른 가장 앞의 수
// 없으면 -1
// 개수 <= 1000000(백만)
// 숫자 범위 <= 1000000000(십억)

// 3 3 1 1 4 4
// 3 3 5 5 -1 -1

let n = Int(readLine()!)!
let nums = readLine()!.split(separator: " ").map { Int(String($0))! }
var result = [Int](repeating: -1, count: nums.count)

var s = 0, e = 0
while e < nums.count - 1 {
    e += 1
    if nums[s] == nums[e] { continue }
    
    for i in s..<e {
        result[i] = e + 1
    }
    s = e
}
print(result.map { String($0) }.joined(separator: " "))
