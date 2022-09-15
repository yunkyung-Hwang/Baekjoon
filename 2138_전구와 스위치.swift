import Foundation

let n = Int(readLine()!)!
var bulb = readLine()!.map { Int(String($0))! }
var goal = readLine()!.map { Int(String($0))! }
var isSame = [Bool](repeating: false, count: n)
for i in 0..<n {
    isSame[i] = bulb[i] == goal[i]
}

let result1 = calculate(isFirstToggle: false, tmpArr: isSame)
let result2 = calculate(isFirstToggle: true, tmpArr: isSame)

[result1, result2].contains(-1) ? print(max(result1, result2)) : print(min(result1, result2))


func calculate(isFirstToggle: Bool, tmpArr: [Bool]) -> Int {
    var result = 0
    var tmpArr = tmpArr
    
    if isFirstToggle {
        tmpArr[0].toggle()
        tmpArr[1].toggle()
        result += 1
    }
    
    for i in 1..<n {
        if tmpArr[i - 1] { continue }
        
        result += 1
        tmpArr[i - 1].toggle()
        tmpArr[i].toggle()
        if i < n-1 { tmpArr[i + 1].toggle() }
    }
    
    return tmpArr.contains(false) ? -1 : result
}
