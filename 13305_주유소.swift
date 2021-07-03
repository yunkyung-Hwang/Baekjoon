import Foundation

let city = Int(readLine()!)!
let length = (readLine()!.split(separator: " ")).map{ Int($0)! }
let price = (readLine()!.split(separator: " ")).map{ Int($0)! }

var lowPrice = price[0]
var result = price[0] * length[0]

for i in 1..<length.count {
    if price[i] < lowPrice {    // 다음 가격이 더 쌀때
        lowPrice = price[i]
    }
    
    result += lowPrice * length[i]
}
print(result)
