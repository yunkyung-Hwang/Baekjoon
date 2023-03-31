import Foundation

// 2143_두 배열의 합

// 문제
// -1000000000 ≤ T ≤ 1000000000 (십억)
// 부 배열이란 배열에서 i~j번째 원소 배열을 말하고 부배열의 합은 i~j의 합을 말한다.
// 두 배열 a, b가 있을때 두 부배열의 합이 t가 되는 경우의 수 구하기

// 풀이
// 일단 부분합

// 시그마 1000 = 500500(5십만) -> 모든 부배열의 합 집합 만들기
// 이 오십만개씩 각자 비교
// 500000 * 500000 = 250000000000 (2천억) 시간초과

let t = Int(readLine()!)!
let n = Int(readLine()!)!
var a = readLine()!.split(separator: " ").map { Int(String($0))! }
var sumA = [Int]()
let m = Int(readLine()!)!
var b = readLine()!.split(separator: " ").map { Int(String($0))! }
var sumB = [Int]()
var result = 0

for i in 0..<n {
    var sum = a[i]
    sumA.append(sum)
    for j in i+1..<n {
        sum += a[j]
        sumA.append(sum)
    }
}

for i in 0..<m {
    var sum = b[i]
    sumB.append(sum)
    for j in i+1..<m {
        sum += b[j]
        sumB.append(sum)
    }
}

sumA.sort()
var dictA = [Int:Int]()
for i in 0..<sumA.count {
    dictA[sumA[i]] = dictA[sumA[i]] != nil ? dictA[sumA[i]]! + 1 : 1
}

//// 여기서 시간초과
//for b in sumB {
//    let t = t - b
//    if let cnt = dictA[t] {
//        result += cnt
//    }
//}

print(result)
