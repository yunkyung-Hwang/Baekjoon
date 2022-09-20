import Foundation

let nrc = readLine()!.split(separator: " ").map { Int($0)! }
let n = nrc[0]
var r = nrc[1]
var c = nrc[2]
var idx = 0

var size = Int(pow(2.0, Double(n)))
while size >= 2 {
    idx += size * size * checkQuadrant(size: size)
    size /= 2
}
print(idx + checkQuadrant(size: size))

func checkQuadrant(size: Int) -> Int {
    let x = r / size
    let y = c / size
    r -= x * size
    c -= y * size
    
    switch [x, y] {
    case [0, 0]:
        return 0
    case [0, 1]:
        return 1
    case [1, 0]:
        return 2
    default:
        return 3
    }
}

// // 메모리 초과
// // 2^15 * 2^15 = 2^30 / 512MB
// import Foundation

// let nrc = readLine()!.split(separator: " ").map { Int($0)! }
// let n = nrc[0]
// let r = nrc[1]
// let c = nrc[2]
// var arr = [[Int]](repeating: [Int](repeating: 0, count: Int(pow(2.0, Double(n)))), count: Int(pow(2.0, Double(n))))

// var idx = 0

// drawZ(startIdx: [0,0], size: Int(pow(2.0, Double(n))))

// func drawZ(startIdx: [Int], size: Int) {
//     if size != 2 {
//         let size = size / 2
//         drawZ(startIdx: [startIdx[0], startIdx[1]], size: size)
//         drawZ(startIdx: [startIdx[0], startIdx[1] + size], size: size)
//         drawZ(startIdx: [startIdx[0] + size, startIdx[1]], size: size)
//         drawZ(startIdx: [startIdx[0] + size, startIdx[1] + size], size: size)
//     } else {
//         arr[startIdx[0]][startIdx[1]] = idx
//         arr[startIdx[0]][startIdx[1] + 1] = idx + 1
//         arr[startIdx[0] + 1][startIdx[1]] = idx + 2
//         arr[startIdx[0] + 1][startIdx[1] + 1] = idx + 3
//         idx += 4
//     }
// }

// print(arr[r][c])
