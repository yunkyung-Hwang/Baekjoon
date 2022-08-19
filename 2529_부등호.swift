// 풀이 1) 런타임 에러

import Foundation

let k = Int(readLine()!)!
let inequality = readLine()!.components(separatedBy: " ").map { String($0) }
var maxArr = [Int](repeating: 0, count: k + 1)
var minArr = [Int](repeating: 0, count: k + 1)
var max = "9876543210"
var min = "0123456789"
var maxResult = ""
var minResult = ""

// >로 시작하는 개수 배열 생성
var prev = ">"
var i = 0
inequality.forEach {
    if $0 != prev {
        i += 1
        prev = $0
    }
    maxArr[i] += 1
}

minArr = maxArr

// 최대값
for j in 1...i {
    if j % 2 != 0 { maxArr[j] += 1 }
    else if j != i { maxArr[j] -= 1 }
}

var index = 0
maxArr.forEach {
    if index % 2 == 0 { //append
        maxResult += max.prefix($0)
    } else {    // reverse and append
        maxResult += max.prefix($0).reversed()
    }
    max = String(max.suffix(max.count - $0))
    index += 1
}
print(maxResult)


// 최소값
for j in 0...i {
    if j % 2 == 0 { minArr[j] += 1 }
    else if j != i { minArr[j] -= 1 }
}

index = 0
minArr.forEach {
    if index % 2 != 0 {
        minResult += min.prefix($0)
    } else {
        minResult += min.prefix($0).reversed()
    }
    min = String(min.suffix(min.count - $0))
    index += 1
}
print(minResult)
