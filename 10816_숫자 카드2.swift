import Foundation

let n = Int(readLine()!)!
var card = readLine()!.split(separator: " ").map { Int($0)! }
let m = Int(readLine()!)!
var checkList = readLine()!.split(separator: " ").map { Int($0)! }
var checkTmp = checkList
var result: [Int: Int] = [:]
var idx1 = 0
var idx2 = 0

card.sort()
checkList.sort()

for i in 0..<m {
    result[checkList[i]] = 0
}

while idx1 < n && idx2 < m {
    if card[idx1] == checkList[idx2] {
        result[checkList[idx2]]! += 1
        idx1 += 1
    } else if card[idx1] > checkList[idx2] {
        idx2 += 1
    } else if card[idx1] < checkList[idx2] {
        idx1 += 1
    }
}

for int in checkTmp {
    print(result[int]!, terminator: " ")
}
