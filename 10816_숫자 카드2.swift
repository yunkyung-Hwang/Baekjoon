import Foundation

let n = Int(readLine()!)!
var card = readLine()!.split(separator: " ").map { Int($0)! }
let m = Int(readLine()!)!
var checkList = readLine()!.split(separator: " ").map { Int($0)! }
var dic: [Int: Int] = [:]
var result = [Int](repeating: 0, count: m)

card.sort()

for card in card {
    dic[card] = dic.keys.contains(card) ? dic[card]! + 1 : 1
}

for i in 0..<m {
    result[i] = dic.keys.contains(checkList[i]) ? dic[checkList[i]]! : 0
}

print(result.map { String($0) }.joined(separator: " "))
