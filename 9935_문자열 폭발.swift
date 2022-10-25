// 문자열
// 복수 subscript

import Foundation

var input = readLine()!
let keyword = readLine()!
var stack = [Character]()

for i in 0..<input.count {
    stack.append(input[i])
    while stack.count >= keyword.count
            && !stack.isEmpty
            && String(stack[stack.count - keyword.count...stack.count - 1]) == keyword {
        stack.removeSubrange(stack.count - keyword.count...stack.count - 1)
    }
}

if stack.isEmpty {
    print("FRULA")
} else {
    print(stack.map{ String($0) }.joined())
}

extension String {
    subscript(_ index: Int) -> Character {
        return self[self.index(self.startIndex, offsetBy: index)]
    }
    
    subscript(_ range: ClosedRange<Int>) -> String {
        let start = self.index(self.startIndex, offsetBy: range.first!)
        let end = self.index(self.startIndex, offsetBy: range.last!)
        return String(self[start...end])
    }
}
