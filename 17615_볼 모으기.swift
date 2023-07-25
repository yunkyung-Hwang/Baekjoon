// 17615_볼 모으기

// 문제
// 볼을 옮겨서 같은 색 볼끼리 인접하게 놓이도록 하려고한다.
// 둘 다 모아져야함!!
// - 같은색 볼 무더기는 한 번에 뛰어넘을 수 있다.
// - 한 가지 색의 공을 선택해서 그 공만 움직일 수 있다.
// 최소이동횟수 구하기

// n <= 5십만

// 풀이
let n = Int(readLine()!)!
let balls = readLine()!.map { String($0) }
var result = Int.max
var tmp = 0

result = min(result, checkLeft("R"))
result = min(result, checkLeft("B"))
result = min(result, checkRight("R"))
result = min(result, checkRight("B"))
print(result)

func checkLeft(_ ball: String) -> Int {
    var count = 0
    var idx = 0
    while idx < balls.count && balls[idx] == ball { idx += 1 }
    if idx >= balls.count - 1 { return 0 }

    for i in idx..<balls.count {
        if i != 0 && balls[i] == ball {
            count += 1
        }
    }
    return count
}

func checkRight(_ ball: String) -> Int {
    var count = 0
    var idx = balls.count - 1
    while idx >= 0 && balls[idx] == ball { idx -= 1 }
    if idx == -1 { return 0 }

    for i in (0..<idx).reversed() {
        if i != balls.count-1 && balls[i] == ball {
            count += 1
        }
    }
    return count
}
