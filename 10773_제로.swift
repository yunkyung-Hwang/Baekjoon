import Foundation

public struct Stack<T> {
    private var elements = Array<T>()
    public init() {}
    
    public mutating func pop() -> T? {
        return self.elements.popLast()
    }
    
    public mutating func push(element: T) {
        self.elements.append(element)
    }
    
    public func peek() -> T? {
        return self.elements.last
    }
    
    public var isEmpty: Bool {
        return self.elements.isEmpty
    }
    
    public var count: Int {
        return self.elements.count
    }
}

var stack = Stack<Int>()
let k = Int(readLine()!)!

for _ in 0..<k {
    let num = Int(readLine()!)!
    if num != 0 {
        stack.push(element: num)
    } else {
        stack.pop()
    }
}

var result = 0

for _ in 0..<stack.count {
    result += stack.pop()!
}

print(result)
