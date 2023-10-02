import Foundation

// 1389_케빈 베이컨의 6단계 법칙
// 문제
// 전혀 관계 없는 두 사람도 6단계 이하로 이어질 수 있다
// 플루이드 워셜

let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, m) = (nm[0], nm[1])
let MAXX = 5001
var arr = [[Int]](repeating: [Int](repeating: MAXX, count: n), count: n)
for _ in 0..<m {
    let line = readLine()!.split(separator: " ").map { Int(String($0))! - 1 }
    arr[line[0]][line[1]] = 1
    arr[line[1]][line[0]] = 1
}
for k in 0..<n {
    for i in 0..<n {
        for j in 0..<n {
            if i == j { arr[i][j] = 0 }
            arr[i][j] = min(arr[i][j], arr[i][k] + arr[j][k])
        }
    }
}

var result = (value: MAXX, index: 0)
for i in 0..<n {
    let kevin = arr[i].reduce(0, +)
    if result.value > kevin {
        result.value = kevin
        result.index = i + 1
    }
}
print(result.index)
