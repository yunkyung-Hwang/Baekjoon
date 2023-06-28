import Foundation

// 풀이
// 세그먼트 트리

let nmk = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, m, k) = (nmk[0], nmk[1], nmk[2])
var nums = [Int](repeating: 0, count: n)
for i in 0..<n {
    nums[i] = Int(readLine()!)!
}
var segmentTree = SegmentTree(array: nums, function: +)
for _ in 0..<m + k {
    let cmd = readLine()!.split(separator: " ").map { Int(String($0))! }
    if cmd[0] == 1 {
        segmentTree.replaceItem(at: cmd[1]-1, withItem: cmd[2])
    } else {
        print(segmentTree.query(leftBound: cmd[1]-1, rightBound: cmd[2]-1))
    }
}

public class SegmentTree<T> {
    private var value: T
    private var function: (T, T) -> T
    private var leftBound: Int
    private var rightBound: Int
    private var leftChild: SegmentTree<T>?
    private var rightChild: SegmentTree<T>?

    public init(array: [T], leftBound: Int, rightBound: Int, function: @escaping (T, T) -> T) {
        self.leftBound = leftBound
        self.rightBound = rightBound
        self.function = function

        if leftBound == rightBound {
            value = array[leftBound]
        } else {
            let middle = (leftBound + rightBound) / 2
            leftChild = SegmentTree<T>(array: array, leftBound: leftBound, rightBound: middle, function: function)
            rightChild = SegmentTree<T>(array: array, leftBound: middle+1, rightBound: rightBound, function: function)
            value = function(leftChild!.value, rightChild!.value)
        }
    }

    public convenience init(array: [T], function: @escaping (T, T) -> T) {
        self.init(array: array, leftBound: 0, rightBound: array.count-1, function: function)
    }

    public func query(leftBound: Int, rightBound: Int) -> T {
        if self.leftBound == leftBound && self.rightBound == rightBound {
            return self.value
        }

        guard let leftChild = leftChild,
              let rightChild = rightChild else { fatalError() }

        if leftChild.rightBound < leftBound {
            return rightChild.query(leftBound: leftBound, rightBound: rightBound)
        } else if rightChild.leftBound > rightBound {
            return leftChild.query(leftBound: leftBound, rightBound: rightBound)
        } else {
            let leftResult = leftChild.query(leftBound: leftBound, rightBound: leftChild.rightBound)
            let rightResult = rightChild.query(leftBound:rightChild.leftBound, rightBound: rightBound)
            return function(leftResult, rightResult)
        }
    }

    public func replaceItem(at index: Int, withItem item: T) {
        if leftBound == rightBound {
            value = item
        } else if let leftChild = leftChild, let rightChild = rightChild {
            if leftChild.rightBound >= index {
                leftChild.replaceItem(at: index, withItem: item)
            } else {
                rightChild.replaceItem(at: index, withItem: item)
            }
            value = function(leftChild.value, rightChild.value)
        }
    }
}
