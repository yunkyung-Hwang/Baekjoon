import Foundation

let n = Int(readLine()!)!
var paper = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
var result = [Int](repeating: 0, count: 3)

for i in 0..<n {
    paper[i] = readLine()!.split(separator: " ").map { Int($0)! }
}

check(startIdx: [0,0], size: n)

func check(startIdx: [Int], size: Int) {
    let start = paper[startIdx[0]][startIdx[1]]
    for i in 0..<size {
        for j in 0..<size {
            if start != paper[startIdx[0] + i][startIdx[1] + j] {
                let size = size / 3
                for k in 0..<3 {
                    for l in 0..<3 {
                        check(startIdx: [startIdx[0] + (k * size), startIdx[1] + (l * size)], size: size)
                    }
                }
                return
            }
        }
    }
    result[start + 1] += 1
}

for result in result {
    print(result)
}
