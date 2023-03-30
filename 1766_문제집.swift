import Foundation

// 1766_문제집

// 문제
// n개의 문제로 되어있는 문제를 풀려고 한다.
// 문제는 난이도 순서대로 출제되어있다. 뒤로 갈 수록 어렵다.
// 먼저 풀면 좋은 문제가 존재한다. ex) 1번 문제를 풀면 4번이 쉬워진다.
// 문제는 모두 풀어야하며 가능한 쉬운 문제부터 풀되 먼저 푸는 것이 좋은 문제가 있는 문제는 반드시 선행 문제를 먼저 풀어야한다.
// 주의 - 먼저 푸는 것이 좋은 문제가 더 쉬운 문제가 아닐 수도 있다.

// 풀이
// 위상 정렬 with 정렬
// 풀이 1) 일반 위상정렬로 구현하고 queue를 매번 sort   / 584ms
// 풀이 2) 어차피 큐에 정렬되어 들어갈거면 heap으로 구현  / 176ms

// 확실히 heap이 훨씬 빠른데 시간 괜찮고 코드스니핏 안되면 힙 구현할 시간에 그냥 큐가 나을듯

let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, m) = (nm[0], nm[1])
var graph = [[Int]](repeating: [Int](), count: n+1)
var inDegree = [Int](repeating: 0, count: n+1)

for _ in 0..<m {
    let l = readLine()!.split(separator: " ").map { Int(String($0))! }
    graph[l[0]].append(l[1])
    inDegree[l[1]] += 1
}

//var queue = [Int]()
var heap = Heap<Int>(compare: <)
for i in 1...n {
    if inDegree[i] == 0 {
//        queue.append(i)
        heap.insert(n: i)
    }
}

var result = ""
//while !queue.isEmpty {
while !heap.isEmpty {
//    let node = queue.removeLast()
    let node = heap.delete()!
    result += "\(node) "
    
    for i in 0..<graph[node].count {
        inDegree[graph[node][i]] -= 1
        if inDegree[graph[node][i]] == 0 {
//            queue.append(graph[node][i])
            heap.insert(n: graph[node][i])
        }
    }
//    queue.sort()
}

print(result)

struct Heap<T: Comparable> {
    var heap: [T]
    
    var compare: (T, T) -> Bool
    
    var root: T? {
        return heap.isEmpty ? nil : heap[0]
    }
    
    var isEmpty: Bool {
        return heap.isEmpty
    }
    
    init(compare: @escaping (T, T) -> Bool) {
        self.heap = []
        self.compare = compare
    }
    
    mutating func insert(n: T) {
        heap.append(n)
        shiftUp(i: heap.count - 1)
    }
    
    mutating func delete() -> T? {
        if heap.isEmpty {
            return nil
        }
        
        if heap.count == 1 {
            return heap.removeFirst()
        }
        
        heap.swapAt(0, heap.count - 1)
        
        let result = heap.removeLast()
        shiftDown(i: 0)
        
        return result
    }
    
    mutating func shiftUp(i: Int) {
        var now = i
        while now > 0 {
            let parent = (now - 1) / 2
            if compare(heap[now], heap[parent]) {
                heap.swapAt(now, parent)
                now = parent
            } else {
                break
            }
        }
    }
    
    mutating func shiftDown(i: Int) {
        var now: Int = i
        var child: Int = 2 * now + 1
        let count: Int = heap.count
        
        while child < count {
            if child + 1 < count {
                child = compare(heap[child], heap[child + 1]) ? child : child + 1
            }
            if compare(heap[child], heap[now]) {
                heap.swapAt(now, child)
                now = child
                child = 2 * now + 1
            } else {
                break
            }
        }
    }
}
