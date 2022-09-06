// 시간초과
// String에서 int로 바꿔도 

import Foundation

var t = Int(readLine()!)!
let dslr = ["", "D", "S", "L", "R"]

while t > 0 {
    let ab = readLine()!.split(separator: " ").map { Int($0)! }
    let a = ab[0]
    let b = ab[1]
    
    bfs(a: a, b: b)
    
    t -= 1
}

func bfs(a: Int, b: Int) {
    var queue = Queue<[Int]>()
    var visit = [Bool](repeating: false, count: 10000)
    
    queue.push([a, 0])
    visit[a] = true
    
    while !queue.isEmpty {
        let tmp = queue.pop()!
        let num = tmp[0]
        let path = tmp[1]
        if num == b {
            var tmp = path
            var result = ""
            while tmp > 0 {
                result += dslr[tmp%10]
                tmp /= 10
            }
            print(result)
            return
        }
        
        // dslr
        var dslrNum = 0
        for i in 1..<5 {
            dslrNum = dslr(i, num)
            if !visit[dslrNum] {
                visit[dslrNum] = true
                queue.push([dslrNum, path * 10 + i])
            }
        }
    }
}

func dslr(_ idx: Int, _ num: Int) -> Int {
    if idx == 1 {
        return num * 2 % 10000
    } else if idx == 2 {
        return num == 0 ? 9999 : num - 1
    } else if idx == 3 {
        return num % 1000 * 10 + num / 1000
    } else if idx == 4 {
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
