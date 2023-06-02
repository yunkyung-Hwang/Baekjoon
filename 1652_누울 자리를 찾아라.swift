import Foundation

// 1652_누울 자리를 찾아라
// 문제
// 연속해서 2칸 이상이 존재하면 쭈우우욱 뻗음(벽이나 짐에 닿을때까지)
// 누울 자리 개수 구하기

// 반례
// 가운데 X가 있으면 두 곳에 누울 수 있음

let n = Int(readLine()!)!
var room = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)
for i in 0..<n {
    room[i] = readLine()!.map { String($0) == "." }
}
// 가로 확인
var h = 0
for i in 0..<n {
    var flag = false
    for j in 1..<n {
        if room[i][j-1] && room[i][j] && !flag {
            h += 1
            flag = true
        }
        if !room[i][j] { flag = false }
    }
}

// 세로 확인
var v = 0
for i in 0..<n {
    var flag = false
    for j in 1..<n {
        if room[j-1][i] && room[j][i] && !flag {
            v += 1
            flag = true
        }
        if !room[j][i] { flag = false }
    }
}
print(h, v)
