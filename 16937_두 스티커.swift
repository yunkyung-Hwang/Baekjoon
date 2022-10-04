import Foundation

let hw = readLine()!.split(separator: " ").map { Int($0)! }
let n = Int(readLine()!)!
var sticker = [[Int]](repeating: [Int](repeating: 0, count: 2), count: n)
var result = 0
for i in 0..<n {
    sticker[i] = readLine()!.split(separator: " ").map { Int($0)! }
}
sticker.sort(by: { $0[0] * $0[1] > $1[0] * $1[1] })


for i in 0..<n {
    for j in i+1..<n {
//         if result > 영역 너비 { continue }  // 있으나 없으나 시간 똑같
        check(r1: i, r2: j)
    }
}

print(result)

func check(r1: Int, r2: Int) {
    for l in 0..<2 {
        for j in 0..<2 {
            for k in 0..<2 {
                let w1 = sticker[r1][j]
                let h1 = sticker[r1][1-j]
                let w2 = sticker[r2][k]
                let h2 = sticker[r2][1-k]
                if w1 + w2 <= hw[l] && max(h1, h2) <= hw[1-l]
                    || h1 + h2 <= hw[1-l] && max(w1, w2) <= hw[l] {
                    result = max(result, w1 * h1 + w2 * h2)
                }
            }
        }
    }
}
