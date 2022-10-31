import Foundation

let t = Int(readLine()!)!
for _ in 0..<t {
    let n = Int(readLine()!)!
    var phoneBook = [String](repeating: "", count: n)
    var set = Set<String>()
    
    for i in 0..<n {
        phoneBook[i] = readLine()!
        set.insert(phoneBook[i])
    }
    
    print(calculate() ? "YES" : "NO")
    
    func calculate() -> Bool {
        for number in phoneBook {
            for j in 1..<number.count {
                if set.contains(String(number.prefix(j))) {
                    return false
                }
            }
        }
        return true
    }
}
