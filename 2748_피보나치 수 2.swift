// 풀이 1)
// 구한 값을 또 구하지 않는 다는 부분에서 재귀와 차이
// 메모이제이션, 한 번 계산한 값을 기록해놨다가 필요 시 
import Foundation

let n = Int(readLine()!)!
var nums = [0,1,1]
fibonacci(n)
print(nums[n])

func fibonacci(_ num: Int) {
    for i in 0...n {
        if i == 0 || i == 1 || i == 2 { continue }
        nums.append(nums[i-1] + nums[i-2])
    }
}

// 풀이 2)
// import Foundation

// let n = Int(readLine()!)!
// print(fibonacci(n))

// func fibonacci(_ num: Int) -> CLongLong {
//     if n <= 2 { return 1 }
    
//     var a, b, c: CLongLong
//     a = 1; b = 1; c = 1
//     for _ in 3...n {
//         c = a + b
//         a = b
//         b = c
//     }
//     return c
// }
