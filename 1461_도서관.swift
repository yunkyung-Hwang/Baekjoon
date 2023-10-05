import Foundation

// 1461_도서관

// 문제
// 책들 위치가 주어질때 책을 모두 제자리에 놔두는 최소 걸음 수
// 한 번에 M권의 책을 들 수 있다
// 2(5 + 3 + 1) + 11
// 돌아올 필요 없으므로 가장 먼 곳에서 종료

let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, m) = (nm[0], nm[1])
var books = readLine()!.split(separator: " ").map { Int(String($0))! }

var result = cutted()

while books.filter({ $0 == 0 }).count != n {
    result += cutted() * 2
}
print(result)

func cutted() -> Int {
    books.sort()
    let far = books.max(by: {abs($0) < abs($1)})!
    for i in 0..<m {
        if far < 0 {
            if books[i] > 0 { break }
            books[i] = 0
        } else if far > 0 {
            if n-1-i < 0 || books[n-1-i] < 0 { break }
            books[n-1-i] = 0
        }
    }
    return abs(far)
}
