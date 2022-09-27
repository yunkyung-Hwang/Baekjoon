// 다시 풀기
import Foundation

let nk = readLine()!.split(separator: " ").map { Int($0)! }
let n = nk[0]
var k = nk[1]
var result = 0

var digit = 1   // 자리수
var cnt = 0     // 번째 숫자

while cnt < k {
    cnt += 9 * digit * Int(pow(10.0, Double(digit - 1)))
    digit += 1
}

digit -= 1
cnt -= 9 * digit * Int(pow(10.0, Double(digit - 1)))
// k에 1 더 빼주기!
k -= cnt + 1
var num = Int(pow(10.0, Double(digit - 1))) + k / digit

if n < num {
    print(-1)
} else {
    print(Array("\(num)")[k % digit])
}

// 구글링

// import Foundation

// let nk = readLine()!.split(separator: " ").map { Int($0)! }
// let n = nk[0]
// var k = nk[1]

// var cnt = 9
// var digit = 1
// var num = 0

// while k > digit * cnt {
//     k -= digit * cnt
    
//     num += cnt
//     cnt *= 10
//     digit += 1
// }

// num += (k - 1) / digit + 1

// if num > n { print(-1) }
// else {
//     let arr = Array(String(num))
//     print(arr[(k-1)%digit])
// }

// 시간초과
// n이 1억이하이기때문에 문자열 만드는 도중 시간초과

// import Foundation

// let nk = readLine()!.split(separator: " ").map { Int($0)! }
// let n = nk[0]
// let k = nk[1]
// var num = ""

// for i in 1...n {
//     num += "\(i)"
// }

// let result = Array(num)
// print(result[k - 1])
