import Foundation

// 7453_합이 0인 네 정수

// 문제
// 정수로 이루어진 크기가 같은 배열 A, B, C, D가 있다.
// A[a], B[b], C[c], D[d]의 합이 0인 (a, b, c, d) 쌍의 개수를 구하는 프로그램을 작성하시오.

// 풀이
// n <= 4000이니까 완전탐색으로 4000^4하면 시간초과 64000000000000
// 2143 두 배열의 합과 유사한 문제
// 단, 딕셔너리 사용 시 시간초과 남
// 이유는 모르겠지만 상수값이 매우 커서 그렇대

// 투포인터도 firstIndex(of:)랑 lastIndex(of:)쓰면 시간초과
// 두 번씩 돌아서 그런듯..?

// 풀이 4920ms, 제한시간 12초

let n = Int(readLine()!)!
var a = [Int](repeating: 0, count: n)
var b = [Int](repeating: 0, count: n)
var c = [Int](repeating: 0, count: n)
var d = [Int](repeating: 0, count: n)
var sums = [[Int]](repeating: [Int](repeating: 0, count: n*n), count: 2)
var result = 0

for i in 0..<n {
    let nums = readLine()!.split(separator: " ").map { Int(String($0))! }
    a[i] = nums[0]
    b[i] = nums[1]
    c[i] = nums[2]
    d[i] = nums[3]
}

var ab = [Int]()
var cd = [Int]()

for i in 0..<n {
    for j in 0..<n {
        ab.append(a[i] + b[j])
        cd.append(c[i] + d[j])
    }
}

ab.sort()
cd.sort()

var s = 0, e = cd.count - 1

while s < ab.count && e >= 0 {
    let sum = ab[s] + cd[e]
    
    if sum > 0 {
        e -= 1
    } else if sum < 0 {
        s += 1
    } else {
        let tmpAB = ab[s]
        var abCnt = 0
        while s < ab.count && ab[s] == tmpAB {
            abCnt += 1
            s += 1
        }
        
        let tmpCD = cd[e]
        var cdCnt = 0
        while e >= 0 && cd[e] == tmpCD {
            cdCnt += 1
            e -= 1
        }
        
        result += abCnt * cdCnt
    }
}

print(result)
