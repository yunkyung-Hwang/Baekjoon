import Foundation

// 1043_거짓말

// 문제
// 지민이는 얘기할 때 과장을 섞어서 이야기한다.
// 하지만 걸리기 싫다.
// 몇 사람들은 이야기의 진실을 알고 이 사람들에게 걸리면 안된다.
// !!! 어떤 사람이 어떤 파티에서는 진실을 듣고, 또다른 파티에서는 과장된 이야기를 들었을 때도 지민이는 거짓말쟁이로 알려지게 된다.
// 과장된 이야기를 할 수 있는 파티의 개수 구하기

// 풀이
// 진실만을 말해야하는 사람이 있는 그룹 제외
// 1. 진실을 알고있는 사람
// 2. 진실을 알고있는 사람과 같은 파티에 간 사람
// 3. 진실을 알고있는 사람과 같은 파티에 간 사람과 같은 파티에 간 사람
// -> 유니온

// 풀이 1)
// 68 - 런타임 에러
// -> 진실을 아는 사람이 없을떄 처리

let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, m) = (nm[0], nm[1])
var parent = Array(0...n)
let t = readLine()!.split(separator: " ").map { Int(String($0))! }
for i in 0..<t[0] {
    if i == 0 { continue }
    union(t[i], t[i+1])
}
var parties = [[Int]](repeating: [Int](), count: m)
var result = m
for _ in 0..<m {
    var party = readLine()!.split(separator: " ").map { Int(String($0))! }
    let cnt = party.removeFirst()
    for i in 0..<cnt-1 {
        union(party[i], party[i+1])
    }
    parties.append(party)
}

let truth = t.count > 1 ? findParent(t[1]) : -1
for party in parties {
    for i in 0..<party.count {
        if findParent(party[i]) == truth {
            result -= 1
            break
        }
    }
}

print(result)

func findParent(_ e: Int) -> Int {
    if parent[e] != e {
        parent[e] = findParent(parent[e])
    }
    return parent[e]
}

func union(_ n1: Int, _ n2: Int) {
    let p1 = findParent(n1)
    let p2 = findParent(n2)
    if p1 < p2 {
        parent[p2] = p1
    } else {
        parent[p1] = p2
    }
}
