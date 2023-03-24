import Foundation

// 22866_탑 보기

// 문제
// 각 건물 옥상에서 양 옆에 존재하는 건물의 옆을 몇 개 볼 수 있는지

// 풀이
// 스택
// 인덱스 확인 잘 하기

let n = Int(readLine()!)!
var buildings = readLine()!.split(separator: " ").map { Int(String($0))! }
var stack = [[Int]]() //[높이, 번호]
var cnt = [Int](repeating: 0, count: n)
var idx = [Int](repeating: 0, count: n)

for i in 0..<n {
    while stack.count > 0 && stack.last![0] <= buildings[i] {
        stack.removeLast()
    }
    cnt[i] += stack.count
    idx[i] = stack.last != nil ? stack.last![1] : Int.max
    stack.append([buildings[i], i])
}

stack = []

for i in 0..<n {
    let index = n-i-1 // 역순으로 접근
    while stack.count > 0 && stack.last![0] <= buildings[index] {
        stack.removeLast()
    }
    cnt[index] += stack.count
    
    if stack.last != nil {
        if idx[index] == Int.max {
            idx[index] = stack.last![1]
        } else if abs(stack.last![1] - index) < abs(index - idx[index]) {
            idx[index] = stack.last![1]
        }
    }
    stack.append([buildings[index], index])
}

var result = ""
for i in 0..<n {
    if cnt[i] == 0 {
        result += "0\n"
    } else {
        result += "\(cnt[i]) \(idx[i] + 1)\n"
    }
}
print(result)
