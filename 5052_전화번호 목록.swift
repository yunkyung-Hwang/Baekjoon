// 풀이 2)
import Foundation

let t = Int(readLine()!)!
for _ in 0..<t {
    let n = Int(readLine()!)!
    var phoneBook = [String](repeating: "", count: n)
    
    for i in 0..<n {
        phoneBook[i] = readLine()!
    }
    phoneBook.sort()
    print(calculate() ? "YES" : "NO")

    func calculate() -> Bool {
        for i in 1..<n {
            if phoneBook[i].hasPrefix(phoneBook[i-1]) {
                return false
            }
        }
        return true
    }
}

// 풀이 1)
// import Foundation

// let t = Int(readLine()!)!
// for _ in 0..<t {
//     let n = Int(readLine()!)!
//     var phoneBook = [String](repeating: "", count: n)
//     var set = Set<String>()
    
//     for i in 0..<n {
//         phoneBook[i] = readLine()!
//         set.insert(phoneBook[i])
//     }
    
//     print(calculate() ? "YES" : "NO")
    
//     func calculate() -> Bool {
//         for number in phoneBook {
//             for j in 1..<number.count {
//                 if set.contains(String(number.prefix(j))) {
//                     return false
//                 }
//             }
//         }
//         return true
//     }
// }
