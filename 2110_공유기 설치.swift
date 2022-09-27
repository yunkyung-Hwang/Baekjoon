// 거리 기준 이분탐색
// low = 가장 짧은 거리 1
// high = 가장 긴 거리 (끝 집 - 첫 집)
// mid = (low + high) / 2
// 이 거리로 공유기 설치 가능한가 판별

import Foundation

let nc = readLine()!.split(separator: " ").map { Int($0)! }
let n = nc[0]
let c = nc[1]
var houses = [Int](repeating: 0, count: n)
var result = 0

for i in 0..<n {
    houses[i] = Int(readLine()!)!
}
houses.sort()

var low = 1
var high = houses[n-1] - houses[0]

while low <= high {
    let mid = (low + high) / 2
    
    var cnt = 1
    var prevHouse = houses[0]
    for i in 1..<n {
        if houses[i] - prevHouse >= mid {
            cnt += 1
            prevHouse = houses[i]
        }
    }
    
    if cnt >= c {
        result = max(result, mid)
        low = mid + 1
    } else {
        high = mid - 1
    }
}

print(result)
