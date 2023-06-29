import Foundation

// 1300_K번째 수

// 문제
// A[i][j] = i*j인 NxN 배열
// 이를 1차원 배열로 만들고 오름차순으로 정렬했을때 k번째 수 구하기

// 풀이
// n <= 100000(십만)
// n^2 = 10000000000(백억) -> 메모리 초과

// 풀이 참고
// 이분탐색
// 모든 수를 구할 필요 없이 구하고자하는 K번째 인덱스만 알면됨
// i*j의 값을 가지므로 일정한 규칙 존재
// -> 행에서 a보다 작거나 같은 수의 개수: a/행번호 > N ? N : a/행번호

let n = Int(readLine()!)!
let k = Int(readLine()!)!

var s = 1, e = k
while s <= e {
    let mid = (s + e) / 2
    var count = 0
    for i in 1...n {
        count += min(mid/i, n)
    }
    
    if count >= k { e = mid - 1 }
    else { s = mid + 1 }
}
print(s)
