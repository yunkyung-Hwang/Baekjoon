import Foundation

// 1158_요세푸스 문제

// 문제
// 1번부터 N번까지 N명의 사람이 원을 이루면서 앉아있고 양의 정수 K가 주어질 때
// N명의 사람이 모두 제거될 때 까지 순서대로 K번째 사람을 계속해서 제거한다

// 풀이 1)
// 인덱스 잘 보기
// 152ms
//let nk = readLine()!.split(separator: " ").map { Int(String($0))! }
//let (n, k) = (nk[0], nk[1])
//var arr = Array(1...n)
//var result = [Int]()
//
//var kk = 1
//var idx = 0
//while !arr.isEmpty {
//    if kk % k == 0 {
//        result.append(arr.remove(at: idx))
//        kk = 0
//        idx -= 1
//    }
//    kk += 1
//    idx += 1
//    if idx > arr.count - 1 { idx = 0 }
//}
//
//print("<\(result.map({String($0)}).joined(separator: ", "))>")

// 풀이 2)
// 인덱스 개선
// 12ms
let nk = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, k) = (nk[0], nk[1])
var arr = Array(1...n)
var result = [Int]()
var kk = k - 1

while arr.count != 1 {
    if kk >= arr.count { kk %= arr.count }
    result.append(arr.remove(at: kk))
    kk += k-1
}
if result.isEmpty {
    print("<\(arr[0])>")
} else {
    print("<\(result.map({ String($0) }).joined(separator: ", ")), \(arr[0])>")
}
