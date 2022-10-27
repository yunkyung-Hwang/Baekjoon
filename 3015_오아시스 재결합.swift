import Foundation
// 뒷사람들이 볼 가능성이 있는 사람을 스택에 저장

let n = Int(readLine()!)!
var stack: [(Int, Int)] = []
var result = 0

for _ in 0..<n {
    let tall = Int(readLine()!)!
    var same = 1
    while !stack.isEmpty && stack.last!.0 <= tall {
        result += stack.last!.1
        same = stack.last!.0 == tall ? stack.last!.1 + 1 : 1
        stack.removeLast()
    }
    
    if !stack.isEmpty { result += 1 }
    stack.append((tall, same))
}

print(result)
