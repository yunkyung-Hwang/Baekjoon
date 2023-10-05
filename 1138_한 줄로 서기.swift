import Foundation

// 1138_한 줄로 서기

// 문제
// 자기보다 큰 사람이 왼쪽에 몇명 있었는지 기억한다.
// 사람들의 키는 모두 다르다.
// p[i] == i번째 사람의 왼쪽에있는 i보다 큰 사람의 명수
// p[i]번째 칸이 비어있다면 거기 넣고 비어있지 않으면 뒤쪽 가장 가까운 0에 넣기

let n = Int(readLine()!)!
let p = readLine()!.split(separator: " ").map { Int(String($0))! }
var result = [Int](repeating: 0, count: n)
for i in 0..<n {
    var count = 0
    for j in 0..<n {
        if result[j] == 0 && count == p[i] {
            result[j] = i+1
            break
        }
        if result[j] == 0 { count += 1 }
    }
}
print(result.map({ String($0) }).joined(separator: " "))

// 풀이 2
//let n: Int = Int(readLine()!)!
//var line:[Int] = readLine()!.split(separator: " ").map{Int($0)!}
//var answer: [Int] = []
//
//for k in (0..<n).reversed(){
//    answer.insert(k+1, at: line[k])
//}
//print(answer.map({ String($0) }).joined(separator: " "))
// import Foundation

// let n = Int(readLine()!)!
// var tallNum = (readLine()!.split(separator: " ")).map{ Int($0)! }
// var arr = [Int](repeating: 0, count: n)

// // tallNum과 빈자리 카운트를 동시에 해야함. 따로하면 틀림
// for i in 0..<n {
//         for j in 0..<n {
//         if tallNum[i] == 0 && arr[j] == 0 {
//             arr[j] = i + 1
//             break
//         } else if arr[j] == 0 {
//             tallNum[i] -= 1
//         }
//     }
// }

// // var arr = [Int](repeating: -1, count: n)
// // for i in 0..<n {
// //     var index = 0
// //     for j in 0..<tallNum[i]{
// //         if arr[j] != -1 {
// //             index += 1
// //         }
// //     }  
// //     index += tallNum[i]  
// //     while arr[index] != -1 {
// //         index += 1
// //     }
// //     arr[index] = i + 1
// // }

// for i in arr {
//     print(i, terminator: " ")
// }
