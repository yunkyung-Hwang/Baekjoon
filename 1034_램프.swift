import Foundation

// 1034_램프

// 문제
// 특정 행에 모든 램프가 켜져있으면 그 행이 켜져있다고 한다.
// 스위치는 열마다 달려있고 스위치를 누르면 해당 열에 속하는 램프들이 토글된다.
// 스위치를 k번 눌러서 켜져 있는 행을 최대로 하려고 한다.
// 같은 스위치를 여러번 눌러도 된다.
// 켜져있는 행의 최대값 구하기

// 풀이
// 스위치가 램프 각각에 붙어있는게 아니라 열을 통채로 바꾼다.
// 1차로 생각난 풀이 -> 조합 완전탐색
// => 조합으로 1000개를 나누면 1000에 대해 모든 경우의 수를 구해야하기에 2^1000만큼 들어서 죽음

// 단순 계산
// 각 행마다 필요한 열 인덱스 저장 ->
// 조건을 만족하면서 가장 많이 겹치는 열 묶음 개수 출력
// 계산 살짝 꼬임
// n개의 토글이 필요하다면 k-n이 짝수이기만하면 됨

let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, m) = (nm[0], nm[1])
var neededCols = [[Int]:Int]()
for _ in 0..<n {
    let row = readLine()!.map { $0 == "1" }
    var need = [Int]()
    for i in 0..<m {
        if row[i] == false { need.append(i) }
    }
    neededCols[need] = neededCols[need] != nil ? neededCols[need]! + 1 : 1
}
let k = Int(readLine()!)!

var result = 0

for col in neededCols {
    let cnt = col.key.count
    if cnt <= k && (k-cnt) % 2 == 0 {
        result = max(result, col.value)
    }
}

print(result)
