import Foundation

let lc = readLine()!.split(separator: " ").map { Int($0)! }
let l = lc[0]
let c = lc[1]
let alphabet = readLine()!.split(separator: " ").map { String($0) }.sorted()
var vowels = [String]()
var consonant = [String]()
var result = [String]()

// c - n >= 2인동안 모음 n개 자음 c - n개 선택 후 정렬 출력
for a in alphabet {
    if a == "a" || a == "e" || a == "i" || a == "o" || a == "u" {
        vowels.append(a)
    } else {
        consonant.append(a)
    }
}

var vowelsCnt = 1
while vowelsCnt <= vowels.count && l - vowelsCnt >= 2 {
    for v in combination(vowels, vowelsCnt) {
        var candidate = [String]()
        v.forEach { candidate.append($0) }
        
        for c in combination(consonant, l - vowelsCnt) {
            c.forEach { candidate.append($0)}
            result.append(candidate.sorted().joined())
            for _ in 0..<l - vowelsCnt {
                candidate.removeLast()
            }
        }
    }
    vowelsCnt += 1
}

for result in result.sorted() {
    print(result)
}

// 조합 코드 
// https://velog.io/@qwer15417/Swift-%EC%88%9C%EC%97%B4%EA%B3%BC-%EC%A1%B0%ED%95%A9
func combination<T: Comparable>(_ array: [T], _ n: Int) -> [[T]] {
    var result = [[T]]()
    if array.count < n { return result }

    func comb(_ index: Int, _ now: [T]) {
        if now.count == n {
            result.append(now)
            return
        }
        
        for i in index..<array.count {
            comb(i + 1, now + [array[i]])
        }
    }
    
    comb(0, [])
    
    return result
}
