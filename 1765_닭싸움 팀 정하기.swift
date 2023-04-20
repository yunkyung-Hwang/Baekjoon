import Foundation

// 1765_닭싸움 팀 정하기

// 문제
// 닭싸움 팀을 정한다.
// 1. 친구의 친구는 친구이다.
// 2. 적의 적도 친구이다.
// 같은 팀에 속해있는 사람들끼리는 전부 친구여야한다.
// 인간관계가 주어졌을때 최대 얼마나 많은 팀이 만들어질 수 있는지 알아내기
// n: 학생 수, m: 알려진 인간관계 개수

// 풀이
// union 사용
// 일단 친구관계 union
// i번의 적 관계 끼리 union

let n = Int(readLine()!)!
let m = Int(readLine()!)!
var enemies = [Int: [Int]]()
var parent = Array(0...n)

for _ in 0..<m {
    let l = readLine()!.split(separator: " ").map{String($0)}
    let p1 = Int(l[1])!, p2 = Int(l[2])!
    if l[0] == "F" {
        // 친구
        union(p1, p2)
    } else {
        // 적
        enemies[p1] = enemies[p1] != nil ? enemies[p1]! + [p2] : [p2]
        enemies[p2] = enemies[p2] != nil ? enemies[p2]! + [p1] : [p1]
    }
}

for enemy in enemies {
    let enemy = enemy.value
    for i in 0..<enemy.count-1 {
        for j in i+1..<enemy.count {
            if findParent(enemy[i]) != findParent(enemy[j]) {
                union(enemy[i], enemy[j])
            }
        }
    }
}

var result = Set<Int>()
for i in 1...n {
    result.insert(findParent(i))
}
print(result.count)

func findParent(_ e: Int) -> Int {
    if e != parent[e] {
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
