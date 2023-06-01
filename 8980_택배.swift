import Foundation

// 8980_택배

// 문제
// 맨 왼쪽부터 트럭에 물건을 실어 배송한다.
// 트럭은 물건을 실을 수 있는 최대 개수가 정해져있다.
// 1번마을부터 n번 마을까지 한 번만 이동한다.(되돌아가지않는다.)
// 배송할 수 있는 최대 박스 개수 구하기

// 풀이
// n <= 2000, c <= 10000, m <= 10000
// 도착지 기준 정렬 후
// 구간별 최대 실을 수 있는 택배 수를 누적한다.

let nc = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, c) = (nc[0], nc[1])
let m = Int(readLine()!)!
typealias Box = (from: Int, to: Int, cnt: Int)
var boxes = [Box](repeating: (0, 0, 0), count: m)
for i in 0..<m {
    let box = readLine()!.split(separator: " ").map { Int(String($0))! }
    boxes[i] = (box[0], box[1], box[2])
}
var truck = [Int: Int]()
for i in 1...n { truck[i] = 0 }

var result = 0
boxes.sort(by: { ($0.1, $0.0) < ($1.1, $1.0) })

for i in 0..<m {
    var maxx = 0
    for town in boxes[i].from..<boxes[i].to {
        maxx = max(maxx, truck[town]!)
        if maxx >= c { break }
    }
    
    if maxx >= c { continue }
    let add = min(c - maxx, boxes[i].cnt)
    result += add
    for town in boxes[i].from..<boxes[i].to {
        truck[town]! += add
    }
}
print(result)
