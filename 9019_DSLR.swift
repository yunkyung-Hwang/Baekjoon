import Foundation

var t = Int(readLine()!)!
let dslr = ["D", "S", "L", "R"]

while t > 0 {
    let ab = readLine()!.split(separator: " ").map { Int($0)! }
    let a = ab[0]
    let b = ab[1]
    
    bfs(a: a, b: b)
    
    t -= 1
}

func bfs(a: Int, b: Int) {
    var queue = Queue<[String]>()
    var visit = [Bool](repeating: false, count: 10000)
    
    queue.push([String(a), ""])
    visit[a] = true
    
    while !queue.isEmpty {
        let tmp = queue.pop()!
        let num = Int(tmp[0])!
        let result = tmp[1]
        if num == b {
            print(result)
            return
        }
        
        // dslr
        var dslrNum = 0
        for i in 0..<4 {
            dslrNum = dslr(i, num)
            if !visit[dslrNum] {
                visit[dslrNum] = true
                queue.push([String(dslrNum), result + dslr[i]])
            }
        }
    }
}

func dslr(_ idx: Int, _ num: Int) -> Int {
    if idx == 0 {
        return num * 2 % 10000
    } else if idx == 1 {
        return num == 0 ? 9999 : num - 1
    } else if idx == 2 {
        return num % 1000 * 10 + num / 1000
    } else if idx == 3 {
        return num % 10 * 1000 + num / 10
    }
    return 0
}

struct Queue<T> {
    var queue: [T] = []
    
    var isEmpty: Bool {
        return queue.isEmpty
    }
    
    mutating func front() -> T? {
        return isEmpty ? nil : queue.first
    }
    
    mutating func push(_ element: T) {
        queue.append(element)
    }
    
    mutating func pop() -> T? {
        return isEmpty ? nil : queue.removeFirst()
    }
}
