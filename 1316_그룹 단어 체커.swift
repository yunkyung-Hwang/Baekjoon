import Foundation

let n = Int(readLine()!)!
var result = 0

for _ in 0..<n {
    let word = readLine()!
    var alphabetArr: [Character] = []

    for alphabet in word {
        if !alphabetArr.contains(alphabet) {
            alphabetArr.append(alphabet)
        } else if alphabetArr.last != alphabet {
            alphabetArr.removeAll()
            break
        }
    }
    
    if alphabetArr.count != 0 {
        result += 1
    }
}

print(result)
