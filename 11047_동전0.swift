import Foundation

let NK = readLine()!
let NKArr = NK.components(separatedBy: " ")
let n = Int(NKArr[0])!
var k = Int(NKArr[1])!

var coin = [Int](repeating: 0, count: n)
var tmp: Int
var result = 0


for i in 0..<n {
    coin[i] = Int(readLine()!)!
}

while k > 0 {  
    
    for i in 0..<n {
        if k / coin[coin.count-1-i] == 0 {
            continue
        }
        result += k / coin[coin.count-1-i]
        k -= k / coin[coin.count-1-i] * coin[coin.count-1-i]
    }
   
}
print(result)
