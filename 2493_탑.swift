import Foundation

//// 2493_탑
//
//// 문제
//// 수평 직선 왼쪽. 가장 먼저 만나는 탑에서만 수신
//// 각 탑이 보낸 신호를 어느 탑이 수신하는지 출력
//// 탑이 없으면 0
//
//// 풀이
//// n <= 5십만. n^2 안댐
//// 어차피 왼쪽의 제일 처음 큰놈 -> 스택
//
let n = Int(readLine()!)!
let towers = readLine()!.split(separator: " ").map { Int(String($0))! }
var stack = [Int]()
var result = ""
var idx = [Int: Int]()
for i in 0..<towers.count {
    idx[towers[i]] = i
}

for tower in towers {
    if stack.isEmpty {
        result += "0 "
    } else {
        var flag = -1
        while !stack.isEmpty {
            let last = stack.last!
            if last > tower {
                flag = last
                break
            } else {
                stack.removeLast()
            }
        }
        result += "\((idx[flag] ?? -1) + 1) "
    }
    stack.append(tower)
}

print(result)
