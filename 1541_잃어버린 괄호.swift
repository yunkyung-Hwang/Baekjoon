import Foundation

let expression = readLine()!
let minusArr = expression.components(separatedBy: "-")
var sum = 0
var isMinusAppear = false

for i in 0..<minusArr.count {
    let plusArr = minusArr[i].components(separatedBy: "+")
    
    if i >= 1 {
        isMinusAppear = true
    }
    
    for j in 0..<plusArr.count {
        if !isMinusAppear{
            sum += Int(plusArr[j])!
        } else {
            sum -= Int(plusArr[j])!
        }
        
    }
}

print(sum)
