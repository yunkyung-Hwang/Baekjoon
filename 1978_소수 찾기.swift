import Foundation

let n = Int(readLine()!)!
let nums = readLine()!
let numsArr = nums.components(separatedBy: " ")

var cnt = 0
var isPrimeNum = true

for i in 0..<n {
    let num = Int(numsArr[i])!
    
    if num == 1 {   // 1일때
        continue
    }
    else{           // 1이 아닐때
        for j in 2..<num {
            if num % j == 0 {
                isPrimeNum = false
                break
            }
        }
        if isPrimeNum {
            cnt += 1
        }
        isPrimeNum = true
    }
}
print(cnt)
