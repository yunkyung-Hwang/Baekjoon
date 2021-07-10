import Foundation

let n = Int(readLine()!)!
var tallNum = (readLine()!.split(separator: " ")).map{ Int($0)! }
var arr = [Int](repeating: 0, count: n)

// tallNum과 빈자리 카운트를 동시에 해야함. 따로하면 틀림
for i in 0..<n {
        for j in 0..<n {
        if tallNum[i] == 0 && arr[j] == 0 {
            arr[j] = i + 1
            break
        } else if arr[j] == 0 {
            tallNum[i] -= 1
        }
    }
}

// var arr = [Int](repeating: -1, count: n)
// for i in 0..<n {
//     var index = 0
//     for j in 0..<tallNum[i]{
//         if arr[j] != -1 {
//             index += 1
//         }
//     }  
//     index += tallNum[i]  
//     while arr[index] != -1 {
//         index += 1
//     }
//     arr[index] = i + 1
// }

for i in arr {
    print(i, terminator: " ")
}
