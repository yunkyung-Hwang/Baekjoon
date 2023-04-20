import Foundation

// 20291_파일 정리

// 문제
// 파일이 5만개 주어졌을때
// 파일을 확장자별로 몇 개씩 있는지
// 확장자를 사전순으로 정리해서 출력

let n = Int(readLine()!)!
var dictionary = [String: Int]()
for _ in 0..<n {
    let file = readLine()!.split(separator: ".").map { String($0) }
    dictionary[file[1]] = dictionary[file[1]] != nil ? dictionary[file[1]]! + 1 : 1
}

for file in dictionary.sorted(by: { $0.key < $1.key }) {
    print(file.key, file.value)
}
