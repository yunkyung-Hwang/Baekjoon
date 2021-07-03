import Foundation

var t = Int(readLine()!)!

while t > 0{
    let xy = (readLine()!.split(separator: " ")).map{ CLongLong($0)! }
    let x = xy[0]
    let y = xy[1]
    let dis: CLongLong = y-x   // 거리

    var n: CLongLong = 1   // 가장 큰 중간 값
    var tmp: CLongLong = 0
    var cnt: CLongLong = 0 // 횟수


    while(true){
        if(n*n > dis){
            n -= 1
            break
        }
        n += 1
    }

    cnt = 2*n - 1

    tmp = dis - n * n

    while(tmp>=0 && n > 0){
        if(tmp-n>=0){
            tmp -= n
            cnt+=1
        }
        else{
            n -= 1
        }
    }
    print(cnt)
    
    t -= 1
}
