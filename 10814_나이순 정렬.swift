import Foundation

// 10814_나이순 정렬.swift

// 풀이
// 정렬

let n = Int(readLine()!)!
typealias User = (age: Int, name: String)
var users = [User]()
for _ in 0..<n {
    let user = readLine()!.split(separator: " ").map { String($0) }
    users.append((Int(user[0])!, user[1]))
}

users.sort(by: { $0.age < $1.age })

for user in users {
    print(user.age, user.name)
}
