// 풀이 2) - 백트래킹
import Foundation

// 백트래킹이란?
// 해를 찾는 도중 해가 아니어서 막히면, 되돌아가서 다시 해를 찾아가는 기법
// 모든 가능한 경우의 수 중에서 특정한 조건을 만족하는 경우에만 살펴보는 것
// dfs에서 조건문 걸어줘서 탐색 중지시키는 것

let lc = readLine()!.split(separator: " ").map { Int($0)! }
let l = lc[0]
let c = lc[1]
let alphabet = readLine()!.split(separator: " ").map { String($0) }.sorted()
var candidate = [String](repeating: "a", count: l)

dfs(idx: 0, cnt: 0)

// a c i s t w

// candidate
// idx:   0, 1, 2, 3
// value: a, c, i, s

func dfs(idx: Int, cnt: Int) {
    if cnt == l {
        if check(candidate) {
            print(candidate.joined())
        }
        return
    }
    
    for i in idx..<c {
        candidate[cnt] = alphabet[i]
        dfs(idx: i+1, cnt: cnt+1)
    }
}

func check(_ pwd: [String]) -> Bool {
    var mo = 0
    var ja = 0
    
    pwd.forEach {
        if $0 == "a" || $0 == "e" || $0 == "i" || $0 == "o" || $0 == "u" {
            mo += 1
        } else {
            ja += 1
        }
    }
    return mo >= 1 && ja >= 2
}


// 풀이 1)
// import Foundation

// let lc = readLine()!.split(separator: " ").map { Int($0)! }
// let l = lc[0]
// let c = lc[1]
// let alphabet = readLine()!.split(separator: " ").map { String($0) }.sorted()
// var vowels = [String]()
// var consonant = [String]()
// var result = [String]()

// // c - n >= 2인동안 모음 n개 자음 c - n개 선택 후 정렬 출력
// for a in alphabet {
//     if a == "a" || a == "e" || a == "i" || a == "o" || a == "u" {
//         vowels.append(a)
//     } else {
//         consonant.append(a)
//     }
// }

// var vowelsCnt = 1
// while vowelsCnt <= vowels.count && l - vowelsCnt >= 2 {
//     for v in combination(vowels, vowelsCnt) {
//         var candidate = [String]()
//         v.forEach { candidate.append($0) }
        
//         for c in combination(consonant, l - vowelsCnt) {
//             c.forEach { candidate.append($0)}
//             result.append(candidate.sorted().joined())
//             for _ in 0..<l - vowelsCnt {
//                 candidate.removeLast()
//             }
//         }
//     }
//     vowelsCnt += 1
// }

// for result in result.sorted() {
//     print(result)
// }

// // 조합 코드 
// // https://velog.io/@qwer15417/Swift-%EC%88%9C%EC%97%B4%EA%B3%BC-%EC%A1%B0%ED%95%A9
// func combination<T: Comparable>(_ array: [T], _ n: Int) -> [[T]] {
//     var result = [[T]]()
//     if array.count < n { return result }

//     func comb(_ index: Int, _ now: [T]) {
//         if now.count == n {
//             result.append(now)
//             return
//         }
        
//         for i in index..<array.count {
//             comb(i + 1, now + [array[i]])
//         }
//     }
    
//     comb(0, [])
    
//     return result
// }
