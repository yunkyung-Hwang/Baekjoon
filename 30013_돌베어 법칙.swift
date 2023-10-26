import Foundation

// 30013_돌베어 법칙

// 문제
// 귀뚜라미의 울음소리와 주변 온도의 연관성
// 귀뚜라미가 우는 횟수를 1초 간격으로 N초 동안 직접 측정
// 울고있는 귀뚜라미가 최소 몇마리인지 알아내기
// - 임의의 시점에 처음 울기 시작하고 이후로 일정 주기마다 운다.
// - !!!!주기는 모두 동일하다.!!!!
// - 임의의 시점에 우는 것을 멈춘다.

// #..##.## -> 2마리

let n = Int(readLine()!)!
let sound = readLine()!.map { String($0) }
var result = Int.max
// 주기
for term in 1..<n {
    result = min(result, check(term, sound))
}
print(result)

func check(_ term: Int, _ sound: [String]) -> Int {
    var count = 0
    var sound = sound
    
    for i in 0..<n {
        if sound[i] == "#" {
            var index = i + term
            while index < n {
                if sound[index] == "." { break }
                sound[index] = "."
                index += term
            }
            count += 1
        }
    }
    return count
}
