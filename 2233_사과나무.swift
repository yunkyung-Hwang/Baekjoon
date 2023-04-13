import Foundation

// 2233 사과나무

// 문제
// 트리에는 최소 두 개의 자식
// 벌레는 루트에서 dfs로 탐색을 진행한다.
// 자식이 여러 개인 경우 왼쪽부터 탐색을 진행한다.
// 노드의 진입은 0, 리턴은 1을 저장하면 하나의 이진 수열이 완성된다.
// 썩은 사과의 경우 제거하고 그 자식들도 모두 제거된다.
// 썩은 사과를 한 개만 제거해서 모든 썩은 사과를 제거하면서 멀쩡한 사과는 최소한으로 삭제한다.
// 제거해야하는 사과 찾기
// 제거해야하는 사과에 방문할 때의 0의 위치와 리턴 될 때의 1의 위치

// 풀이
// 냅다 트리 만들고
// 썩은 사과 두 개 or 한 개 찾아서
// 한 개라면 세번째 줄이 답
// 두 개라면 두 개의 사과를 찾아서 최소 공통 부모 찾기
// 트리 자체에 depth, inputIdx, outputIdx 저장

// 트리에서 최소 공통 조상 찾기(LCA, Lowest Common Ancestor)
// 1. depth가 같을때까지 depth 깊은 놈 올리기
// 2. 두 노드가 같을때까지 두 놈 다 올리기

// 그냥 생각한건 2번을 부모가 같을때 까지 올리고 부모를 return했으나
// 이 경우 둘이 같은지를 또 한 번 확인해줘야하고 맨날 이거 안해서 틀림

let n = Int(readLine()!)!
let binary = readLine()!.map { Int(String($0))! }
let rottenIdx = readLine()!.split(separator: " ").map { Int(String($0))! }
var rottenAppleIdx = [Int]()
var tree = [Node(num: 0, parentNum: -1, inputIdx: -1, depth: 0)]
var parentIdx = 0
var nodeNum = 1
var depth = 0
for i in 0..<binary.count {
    if binary[i] == 0 {
        depth += 1
        let node = Node(num: nodeNum,
                        parentNum: parentIdx,
                        inputIdx: i+1,
                        depth: depth)
        nodeNum += 1
        tree[parentIdx].children.append(node)
        parentIdx = node.num
        tree.append(node)
        if rottenIdx.contains(i+1) && !rottenAppleIdx.contains(node.num) {
            rottenAppleIdx.append(node.num)
        }
    } else {
        depth -= 1
        tree[parentIdx].outputIdx = i+1
        if rottenIdx.contains(i+1) && !rottenAppleIdx.contains(tree[parentIdx].num) {
            rottenAppleIdx.append(tree[parentIdx].num)
        }
        parentIdx = tree[parentIdx].parentNum
    }
}

if rottenAppleIdx.count == 1 {
    print(rottenIdx.map { String($0) }.joined(separator: " "))
} else {
    var a1 = tree[rottenAppleIdx[0]]
    var a2 = tree[rottenAppleIdx[1]]
    
    while a1.depth != a2.depth {
        if a1.depth < a2.depth {
            a2 = tree[a2.parentNum]
        } else {
            a1 = tree[a1.parentNum]
        }
    }
    
    while a1.num != a2.num {
        a1 = tree[a1.parentNum]
        a2 = tree[a2.parentNum]
    }
    print(a1.inputIdx, a1.outputIdx!)
}

class Node {
    let num: Int
    var parentNum: Int
    var children = [Node]()
    let inputIdx: Int
    var outputIdx: Int?
    let depth: Int
    
    init(num: Int, parentNum: Int, inputIdx: Int, depth: Int) {
        self.num = num
        self.parentNum = parentNum
        self.inputIdx = inputIdx
        self.depth = depth
    }
    
    func addChild(_ child: Node) {
        self.children.append(child)
    }
}
