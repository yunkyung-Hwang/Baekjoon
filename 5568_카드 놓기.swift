import Foundation

// 5568_카드 놓기

// 풀이
// k개를 뽑아서 만들 수 있는 수
// 순열

let n = Int(readLine()!)!
let k = Int(readLine()!)!
var cards = [Int](repeating: 0, count: n)
var result = Set<String>()
for i in 0..<n {
    cards[i] = Int(readLine()!)!
}

permutation(cards, k).forEach {
    result.insert($0.map { String($0)}.joined())
}
print(result.count)

func permutation<T: Comparable>(_ array: [T], _ n: Int) -> [[T]] {
    var result = [[T]]()
    if array.count < n { return result }

    var visited = Array(repeating: false, count: array.count)

    func cycle(_ now: [T]) {
        if now.count == n {
            result.append(now)
            return
        }

        for i in 0..<array.count {
            if visited[i] {
                continue
            } else {
                visited[i] = true
                cycle(now + [array[i]])
                visited[i] = false
            }
        }
    }

    cycle([])

    return result
}
