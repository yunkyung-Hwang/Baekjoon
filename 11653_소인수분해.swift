import Foundation

var num = Int(readLine()!)!

if num != 1 {
    while num != 1 {
        for j in 2...num {
            if num % j == 0 {
                print(j)
                num /= j
                break
            }
        }
    }
}
