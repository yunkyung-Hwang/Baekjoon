import Foundation

let nm = (readLine()!.split(separator: " ")).map{ Int($0)! }
let n = nm[0]
let m = nm[1]

var trains :[[Bool]] = Array(repeating: Array(repeating: false, count: 20), count: n)

for _ in 0..<m{
    let cmd = readLine()!.components(separatedBy: " ")
    let trainNum = Int(cmd[1])! - 1

    if cmd[0] == "1" {
        let seatNum = Int(cmd[2])! - 1
        trains[trainNum][seatNum] = true
    } else if cmd[0] == "2" {
        let seatNum = Int(cmd[2])! - 1
        trains[trainNum][seatNum] = false
    } else if cmd[0] == "3" {
        trains[trainNum].removeLast()
        trains[trainNum].insert(false, at: 0)
    } else if cmd[0] == "4" {
        trains[trainNum].removeFirst()
        trains[trainNum].append(false)
    }
}

var cnt: Set<String> = []

for i in 0..<n {
    var tmp = ""
    for j in 0..<20 {
        if trains[i][j] {
            tmp += "1"
        } else {
            tmp += "0"
        }
    }
    cnt.insert(tmp)
}
print(cnt.count)

// 조합 : O(2^n) 터질만하군
// var cnt = 0
// var isNewTrain = [Bool](repeating: true, count: n)
// for i in 0..<n-1 {
//     for j in i+1..<n {
//         if trains[i].elementsEqual(trains[j]) {
//             isNewTrain[j] = false
//         }
//     }
// }

// for i in isNewTrain {
//     if i {
//         cnt += 1
//     }
// }

// print(cnt)
