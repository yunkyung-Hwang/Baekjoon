import Foundation

let n = Int(readLine()!)!
var heap = [-1]

for _ in 0..<n {
    let x = Int(readLine()!)!
    if x == 0 {
        print(delete())
    } else {
        insert(x)
    }
}

func insert(_ num: Int) {
    heap.append(num)
    
    let size = heap.count - 1
    var pIdx = size / 2
    
    while size > 1 {
        let lIdx = pIdx * 2
        let rIdx = pIdx * 2 + 1
        var idx: Int?
        
        if lIdx <= size && heap[lIdx] < heap[pIdx] {
            idx = lIdx
        }
        if rIdx <= size && heap[rIdx] < heap[pIdx] && heap[rIdx] < heap[lIdx] {
            idx = rIdx
        }
        guard let idx = idx else { break }

        heap.swapAt(idx, pIdx)
        pIdx /= 2
    }
}

func delete() -> Int {
    let size = heap.count - 1
    if size == 0 { return 0 }
    
    let result = heap[1]
    heap[1] = heap[size]
    heap.removeLast()
    
    var pIdx = 1
    
    while size > 1 {
        let lIdx = pIdx * 2
        let rIdx = pIdx * 2 + 1
        var idx: Int?
        
        if lIdx < size && heap[lIdx] < heap[pIdx] {
            idx = lIdx
        }
        if rIdx < size && heap[rIdx] < heap[pIdx] && heap[rIdx] < heap[lIdx] {
            idx = rIdx
        }
        guard let idx = idx else { break }

        heap.swapAt(idx, pIdx)
        pIdx = idx
    }
    
    return result
}
