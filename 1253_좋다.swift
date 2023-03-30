import Foundation

// 1253_좋다

// 문제
// N개의 수 중에서 어떤 수가 다른 두 수 두개의 합으로 나타낼 수 있다면 그 수를 '좋다'고 한다.
// N개의 수 중 좋은 수가 몇개인지 구해라.
// 수의 위치가 다르면 값이 같아도 다른 수이다. == 중복된 수가 있을 수 있다.

// 풀이 1) 두 수를 뽑아서 두 수의 합을 저장하는 Set을 만들기 / 632ms
// 반례) 숫자 목록에 0이 포함되어있는 경우 0과 본인을 선택해서 만들 수 있다.
// -> Set말고 Dictionary로 구현해서 개수 세주고 0의 개수만큼 빼주기
// num이 0일때 0이 아닐때 구분
// (시그마 2000) + n -> 2003000(2백만)

// 풀이 2) 투포인터 / 28ms
// 위 풀이도 맞지만 다른사람들에 비해 매우 느리므로 문제 분류 보고 재풀이
// 정렬해서 투포인터로 양 끝에서부터 접근한다.
// 부분합이 아니라면 투포인터는 양 사이드에서 출발한다.

let n = Int(readLine()!)!
let nums = readLine()!.split(separator: " ").map { Int(String($0))! }.sorted()
var result = 0

for i in 0..<n {
    var s = 0, e = n-1
    while s < e {
        let sum = nums[s] + nums[e]
        if sum < nums[i] {
            s += 1
        } else if sum > nums[i] {
            e -= 1
        } else {
            if s == i {
                s += 1
            } else if e == i {
                e -= 1
            } else {
                result += 1
                break
            }
        }
    }
}

print(result)

// 풀이 1
// let n = Int(readLine()!)!
// let nums = readLine()!.split(separator: " ").map { Int(String($0))! }.sorted()
// var sums = [Int:Int]()
// var zeroCnt = 0
// var result = 0

// for i in 0..<n {
//     if nums[i] == 0 { zeroCnt += 1 }
//     for j in i+1..<n {
//         sums[nums[i] + nums[j]]
//         = sums[nums[i] + nums[j]] != nil
//         ? sums[nums[i] + nums[j]]! + 1 : 1
//     }
// }

// for num in nums {
//     if sums[num] != nil {
//         if (num != 0 && sums[num]! - zeroCnt > 0)
//             || (num == 0 && sums[num]! - (zeroCnt-1) > 0) {
//             result += 1
//         }
//     }
// }

// print(result)
