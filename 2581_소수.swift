import Foundation

let m = Int(readLine()!)!
let n = Int(readLine()!)!

var min = 0
var sum = 0
var isPrimeNum = true

for num in m...n {
    if num == 1 {
        continue
    }
    
    for j in 2..<num {
        if num % j == 0 {
            isPrimeNum = false
            break
        }
    }
    if isPrimeNum{
        if min == 0{
            min = num
        }
        sum += num
    }
    isPrimeNum=true
}
if sum == 0 {
    print(-1)
}
else{
    print(sum)
    print(min)
}
