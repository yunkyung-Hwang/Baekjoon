import Foundation

let n = readLine()!
let digit = n.count
let num = Int(n)!
var sum = 0

if digit != 1 {
    for i in 1..<digit {
        sum += 9 * Int(pow(10.0, Double(i-1))) * i
    }
}

sum += (num - Int(pow(10.0, Double(digit-1))) + 1) * digit

print(sum)
