// 풀이 1
// 문자열
// 복수 subscript

// 풀이 2
// 마지막 문자 기준 비교 & 삭제
import Foundation

var input = readLine()!.map { String($0) }
let keyword = readLine()!
var stack = [String]()

for c in input {
    stack.append(c)
    
    if c == String(keyword.last!)
        && stack.count >= keyword.count
        && stack[(stack.count - keyword.count)...].joined() == keyword {
        stack.removeSubrange((stack.count - keyword.count)...)
    }
}

print(stack.isEmpty ? "FRULA" : stack.joined())

// import Foundation

// var input = readLine()!
// let keyword = readLine()!
// var stack = [Character]()

// for i in 0..<input.count {
//     stack.append(input[i])
//     while stack.count >= keyword.count
//             && !stack.isEmpty
//             && String(stack[stack.count - keyword.count...stack.count - 1]) == keyword {
//         stack.removeSubrange(stack.count - keyword.count...stack.count - 1)
//     }
// }

// if stack.isEmpty {
//     print("FRULA")
// } else {
//     print(stack.map{ String($0) }.joined())
// }

// extension String {
//     subscript(_ index: Int) -> Character {
//         return self[self.index(self.startIndex, offsetBy: index)]
//     }
    
//     subscript(_ range: ClosedRange<Int>) -> String {
//         let start = self.index(self.startIndex, offsetBy: range.first!)
//         let end = self.index(self.startIndex, offsetBy: range.last!)
//         return String(self[start...end])
//     }
// }
