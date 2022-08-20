// 입력받을때마다 알파벳이 어떤 자리에 나오는지 세고 딕셔너리에 저장
// 이미 딕셔너리에 포함된 알파벳이라면 기존값에 더하기
// ex) A_AA__ => 101100
//     _AA___ => 112100
// 딕셔너리 정렬 후 큰 숫자부터 곱해서 더하기

import Foundation

let n = Int(readLine()!)!
var dict: [String:Int] = [:]
var num = 9
var result = 0

for _ in 0..<n {
    let word = Array(readLine()!)
    
    for i in 0..<word.count {
        if dict.keys.contains(String(word[i])) {
            dict.updateValue(dict[String(word[i])]! + Int(pow(10.0, Double(word.count - i - 1))),
                             forKey: String(word[i]))
        } else {
            dict[String(word[i])] = Int(pow(10.0, Double(word.count - i - 1)))
        }
    }
}

dict.values.sorted(by: >).forEach {
    result += $0 * num
    num -= 1
}

print(result)
