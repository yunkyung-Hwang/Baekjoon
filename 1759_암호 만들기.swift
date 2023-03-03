// 풀이 2) - 백트래킹
import Foundation

// 1759 암호 만들기

// 문제
// 서로 다른 L개의 알파벳 소문자로 구성된 암호
// 최소 한개의 모음과 두 개 이상의 자음으로 구성
// 암호는 정렬되어있음
// 암호 구성 알파벳 후보는 C가지가 있다

// 풀이 1) 조합
// 가능한 모든 정렬된 조합을 만들고
// 모음 개수가 1 이상이고 자음 개수가 2 이상이면 결과 배열에 추가한다
// 결과 배열을 정렬하여 출력한다.

// 시간복잡도
// 조합 만들기 O(2^c)
// 만든 조합 탐색하고 결과에 맞는지 확인하고 맞으면 정렬 및 join해서 결과 배열 추가 O(2^c * l * l)
// O(2^c + 2^c * l * l)
// O(7405568)

// ** join의 시간복잡도 **

//let lc = readLine()!.split(separator: " ").map { Int(String($0))! }
//let (l, c) = (lc[0], lc[1])
//let alphabet = readLine()!.split(separator: " ").map{ String($0) }
//var result = [String]()
//
//for pw in combination(alphabet, l) {
//    if !isPossible(pw) { continue }
//    result.append(pw.sorted().joined())
//}
//
//for r in result.sorted() {
//    print(r)
//}
//
//func isPossible(_ pw: [String]) -> Bool {
//    var vowelsCnt = 0
//    var consonantsCnt = 0
//    for alphabet in pw {
//        if alphabet == "a"
//            || alphabet == "e"
//            || alphabet == "i"
//            || alphabet == "o"
//            || alphabet == "u" {
//            vowelsCnt += 1
//        } else {
//            consonantsCnt += 1
//        }
//    }
//    return vowelsCnt >= 1 && consonantsCnt >= 2
//}
//
//func combination<T: Comparable>(_ array: [T], _ n: Int) -> [[T]] {
//    var result = [[T]]()
//    if array.count < n { return result }
//    func comb(_ index: Int, _ now: [T]) {
//        if now.count == n {
//            result.append(now)
//            return
//        }
//        
//        for i in index..<array.count {
//            comb(i + 1, now + [array[i]])
//        }
//    }
//    
//    comb(0, [])
//    
//    return result
//}

// 4달 전 풀이) dfs + 백트래킹
// 더 빠름

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
