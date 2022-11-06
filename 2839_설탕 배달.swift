import Foundation

var n = Int(readLine()!)!
var result = 0

while n >= 0 {
    if n % 5 == 0 {
        result += n / 5
        n = 0
        break
    }
    n -= 3
    result += 1
}

print(n == 0 ? result : -1)
