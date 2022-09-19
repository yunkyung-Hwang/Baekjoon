import Foundation

let n = Int(readLine()!)!
var move = [String]()   // 타입 변경!
var result = 0

hanoi(from: 1, to: 3, tmp: 2, cnt: n)
print(result)
move.forEach {
    print($0)
}

func hanoi(from: Int, to: Int, tmp: Int, cnt: Int) {
    result += 1
    if cnt == 1 { move.append("\(from) \(to)") }
    else {
        hanoi(from: from, to: tmp, tmp: to, cnt: cnt - 1)
        move.append("\(from) \(to)") 
        hanoi(from: tmp, to: to, tmp: from, cnt: cnt - 1)
    }
}
