import Foundation

// 3584_가장 가까운 공통 조상

// 문제
// 트리에서 두 노드가 주어지면 가장 가까운 공통 조상 찾기

let t = Int(readLine()!)!
for _ in 0..<t {
    let n = Int(readLine()!)!
    var tree = [Node]()
    
    // 노드 생성
    for i in 0...n {
        tree.append(Node(num: i))
    }
    
    // 부모 연결
    for _ in 0..<n-1 {
        let l = readLine()!.split(separator: " ").map { Int(String($0))! }
        tree[l[1]].parentNum = l[0]
    }
    
    // 찾을 노드 입력
    let nodes = readLine()!.split(separator: " ").map { Int(String($0))! }
    var (n1, n2) = (tree[nodes[0]], tree[nodes[1]])
    
    // 1. depth 구하기
    var t1 = n1
    while t1.parentNum != 0 {
        t1 = tree[t1.parentNum]
        n1.depth += 1
    }
    var t2 = n2
    while t2.parentNum != 0 {
        t2 = tree[t2.parentNum]
        n2.depth += 1
    }
    
    // 2. depth 같게하기
    let flag = n1.depth < n2.depth
    for _ in 0..<abs(n1.depth - n2.depth) {
        if flag {
            n2 = tree[n2.parentNum]
        } else {
            n1 = tree[n1.parentNum]
        }
    }
    
    // 3. 같아질 때까지 올리기
    while n1.num != n2.num {
        n1 = tree[n1.parentNum]
        n2 = tree[n2.parentNum]
    }
    
    print(n1.num)
}


class Node {
    let num: Int
    var parentNum: Int = 0
    var depth = 0
    
    init(num: Int) {
        self.num = num
    }
}
