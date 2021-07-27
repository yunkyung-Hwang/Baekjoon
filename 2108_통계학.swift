import Foundation

let n = Int(readLine()!)!
var IntegerArr: [Int] = []
var sum = 0

var count: [Int:Int] = [:]  // 입력값을 키로하여 개수를 저장하는 딕셔너리
var mode = 0

for _ in 0..<n {
    let integer = Int(readLine()!)!
    sum += integer
    IntegerArr.append(integer)

    // 존재하는 값이면 개수 1 추가 존재하지 않는 값이면 0으로 초기화
    count[integer] = ( count[integer] != nil ? count[integer]! : 0 ) + 1
    // 최빈값이 작으면 해당 값을 최빈값으로 할당
    mode = mode < count[integer]! ? count[integer]! : mode
}

IntegerArr.sort()
let filtered = count.filter{ $0.value == mode } // 최빈값인 애들만 뽑기
let countSorted = filtered.sorted{ $0.key < $1.key }    // 키값 기준 정렬

print(Int(round(Double(sum) / Double(n))))
print(IntegerArr[n / 2])
print(countSorted[countSorted.count > 1 ? 1 : 0].key)   // 2개이상이면 두번째 값 1개이하면 첫번째값
print(IntegerArr.last! - IntegerArr.first!)
