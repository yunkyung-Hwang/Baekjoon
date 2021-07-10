import Foundation

let n = Int(readLine()!)!
let m = Int(readLine()!)!

var friends : [[Int]] = Array(repeating: Array(repeating: 0, count: 2), count: m)
var isFriend = [Bool](repeating: false, count: n)   // 상근이 친구
var isFriendsFriend = [Bool](repeating: false, count: n)    // 상근이 친구의 친구
var cnt = 0

for i in 0..<friends.count {    // 입력
    friends[i] = (readLine()!.split(separator: " ")).map{ Int($0)! }
}
//print(friends)

for i in 0..<friends.count {
    if friends[i][0] == 1 { // 상근이 친구 찾기
        isFriend[friends[i][1] - 1] = true
    }
}

for i in 0..<friends.count {
    if friends[i][0] != 1 && isFriend[friends[i][0] - 1] {  // 친구의 친구 찾기
        isFriendsFriend[friends[i][1] - 1] = true
    } else if friends[i][0] != 1 && isFriend[friends[i][1] - 1] {   // !!양방향 확인!!
        isFriendsFriend[friends[i][0] - 1] = true
    }   
}

for i in 0..<isFriend.count {
    //print(isFriend[i],isFriendsFriend[i])
    if isFriend[i] || isFriendsFriend[i]{
        cnt += 1
    }
}
print(cnt)
