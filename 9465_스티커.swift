import Foundation

let t = Int(readLine()!)!

for _ in 0..<t {
    let n = Int(readLine()!)!
    var sticker = [[Int]](repeating: [Int](repeating: 0, count: n), count: 2)
    for i in 0..<2 {
        sticker[i] = readLine()!.split(separator: " ").map { Int($0)! }
    }
    
    var result = 0
    for i in 0..<n {
        for j in 0..<2 {
            let tmp = sticker[j][i]
            let idx = j == 0 ? 1 : 0
            if i-1 >= 0 { sticker[j][i] += sticker[idx][i-1] }
            if i-2 >= 0 { sticker[j][i] = max(sticker[j][i], tmp + sticker[idx][i-2]) }
            result = max(sticker[j][i], result)
        }
    }
    print(result)
}
