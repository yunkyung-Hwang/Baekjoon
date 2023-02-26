import Foundation

// 2467 용액

// **문제**
// 산성: 1 ~ 십억
// 알칼리성: -십억 ~ -1
// 0에 가장 가까운 시약 만들기

// **시간복잡도**
// n <= 십만
// O(n^2): 10000000000 백억 (펑)
// O(n)으로 풀기

// **풀이 1) - 투포인터**
// 둘의 부호가 다르면 더하고
//          같으면 빼서
// 둘 중 작은 값으로 결과 비교
// 틀렸습니다.

// **해결**
// 문제 이해 잘못함..
// 두 용액을 섞어서 만드는 것이니까 그냥 더하면 됨
// 두 값의 합이 < 0 이면 값을 증가해야하니 왼쪽을 ++
//           > 0 이면 값을 감소해야하니 오른쪽을 --

// 총평
// 문제 잘 읽기!!!!

let n = Int(readLine()!)!
let nums = readLine()!.split(separator: " ").map { Int(String($0))! }

var s = 0, e = n - 1
var value = Int.max
var result = (0, 0)

while s < e {
    let dif = abs(nums[e] + nums[s])
    if value > dif {
        value = dif
        result = (nums[s], nums[e])
    }
    
    if nums[e] + nums[s] > 0 {
        e -= 1
    } else {
        s += 1
    }
}

print(result.0, result.1)
