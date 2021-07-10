import Foundation

let nm = (readLine()!.split(separator: " ")).map{ Int($0)! }
let n = nm[0]
let m = nm[1]

var trains = [Int](repeating: 0, count: n)

for _ in 0..<m{
    let cmd = readLine()!.components(separatedBy: " ")
    let trainNum = Int(cmd[1])! - 1

    if cmd[0] == "1" {
        trains[trainNum] |= (1 << (Int(cmd[2])! - 1))
    } else if cmd[0] == "2" {
        trains[trainNum] &= ~(1 << (Int(cmd[2])! - 1))
    } else if cmd[0] == "3" {
        trains[trainNum] <<= 1
        trains[trainNum] &= ~(1 << 20)
    } else if cmd[0] == "4" {
        trains[trainNum] >>= 1
    }
}

var cnt: Set<Int> = []

for i in 0..<trains.count {
    cnt.insert(trains[i])
}
print(cnt.count)
