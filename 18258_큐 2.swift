import Foundation

let n = Int(readLine()!)!
var queue: Queue = Queue([])
var result = ""

for _ in 0..<n {
    let command = readLine()!.split(separator: " ")
    
    let c = command.first!
    if c == "push" {
        queue.push(command[1])
    } else if c == "pop" {
        result += "\(queue.pop() ?? -1)\n"
    } else if c == "size" {
        result += "\(queue.count)\n"
    } else if c == "empty" {
        result += "\(queue.isEmpty ? 1 : 0)\n"
    } else if c == "front" {
        result += "\(queue.front ?? -1)\n"
    } else if c == "back" {
        result += "\(queue.back ?? -1)\n"
    }
}

print(result)

class Queue<T> {
    private var enqueue: [T]
    private var dequeue: [T] = []
    
    init(_ queue: [T]) {
        enqueue = queue
    }
    
    var isEmpty: Bool {
        return enqueue.isEmpty && dequeue.isEmpty
    }

    var count: Int {
        return enqueue.count + dequeue.count
    }

    var front: T? {
        return enqueue.first
    }

    var back: T? {
        return enqueue.last
    }
    
    func push(_ num: T) {
        enqueue.append(num)
    }

    func pop() -> T? {
        if dequeue.isEmpty {
            dequeue = enqueue.reversed()
            enqueue.removeAll()
        }
        return dequeue.popLast()
    }
}
