import Foundation

// 11812_K진 트리

// 문제
// 자식을 최대 k개 가질 수 있는 트리를 k진 트리라한다.
// 총 n개의 노드로 이루어진 k진 트리가 주어진다.
// 트리는 적은 에너지 방법으로 생성된다. 이전 깊이를 모두 채운 경우에만 새로운 깊이를 만든다.
// 추가는 맨 왼쪽부터 차례로 한다.
// 두 노드 사이의 거리 구하기 (== 두 노드 사이에 존재하는 간선의 개수)
// n <= 1000000000000000 (천조??)
// k <= 1000
// q <= 100000 (십만)
// 트리 만들면 그냥 시간초과 날것이고 어차피 들어가는 곳 정해져있으니 정해진 숫자로 바로 계산
// depth가 다르다면 depth가 같아질 때 까지 더 깊은 놈을 위로 올리고 cnt1 += 1
// depth가 같고 부모가 같다면 return cnt1
// depth가 같은데 부모가 다르다면 같은 부모가 나올 때 까지 부모의 부모 찾기 cnt2 += 1
// return cnt1 + cnt2 * 2

let nkq = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, k, q) = (nkq[0], nkq[1], nkq[2])

for _ in 0..<q {
    let node = readLine()!.split(separator: " ").map { Int(String($0))! }
    print(getDistance(node[0], node[1]))
}

func getDistance(_ n1: Int, _ n2: Int) -> Int {
    if k == 1 { return abs(n1 - n2) }
    
    var n1 = n1-1, n2 = n2-1
    var cnt1 = 0, cnt2 = 0
    var d1 = getDepth(n1), d2 = getDepth(n2)
    // depth가 다른 경우 depth 맞춰주기
    while d1 != d2 {
        cnt1 += 1
        if d1 > d2 {
            n1 = getParent(n1)
            d1 = getDepth(n1)
        } else {
            n2 = getParent(n2)
            d2 = getDepth(n2)
        }
    }
    // 부모가 다른 경우 부모가 같을 때 까지 같이 올려주기
    var p1 = getParent(n1), p2 = getParent(n2)
    while p1 != p2 {
        cnt2 += 1
        n1 = getParent(n1)
        n2 = getParent(n2)
        p1 = getParent(n1)
        p2 = getParent(n2)
    }
    let tmp = n1 == n2 ? 0 : 2
    return cnt1 + cnt2 * 2 + tmp
}

func getParent(_ num: Int) -> Int {
    return num % k == 0 ? num / k - 1 : num / k
}

func getDepth(_ num: Int) -> Int {
    var depth = 0
    var num = num
    
    while num >= Int(pow(Double(k), Double(depth))) {
        num -= Int(pow(Double(k), Double(depth)))
        depth += 1
    }
    return depth
}
