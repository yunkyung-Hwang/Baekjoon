import Foundation

// 1068 트리

// 문제
// 트리에서 주어진 노드를 제거하였을때 리프 노드 개수 출력

// 풀이
// 트리 만들고 dfs
// 해당 노드 만나면 개수 안세고 return

let n = Int(readLine()!)!
let parent = readLine()!.split(separator: " ").map { Int(String($0))! }
let num = Int(readLine()!)!

var tree = [Node]()
var root: Node!
var cnt = 0

for i in 0..<n {
    tree.append(Node(num: i))
}

for i in 0..<n {
    if parent[i] == -1 {
        root = tree[i]
        continue
    } else if i == num {
        continue
    }
    
    tree[parent[i]].addChild(tree[i])
}

dfs(node: root)
print(cnt)

func dfs(node: Node) {
    if node.num == num { return }
    if node.child.count == 0 {
        cnt += 1
    }
    for i in 0..<node.child.count {
        dfs(node: node.child[i])
    }
}

class Node {
    var num: Int
    var child = [Node]()
        
    init(num: Int) {
        self.num = num
    }
    
    func addChild(_ node: Node) {
        child.append(node)
    }
}
