import Foundation

let num = Int(readLine()!)!
// 1일때 고려
if num == 1 {
    print(0)
    exit(0)
}
var primeArray = [0] + makePrimeArray(num)
var p1 = 0
var p2 = 1
var result = 0

for i in 1..<primeArray.count {
    primeArray[i] += primeArray[i - 1]
}

// 투포인터
while p1 < primeArray.count && p2 < primeArray.count {
    if primeArray[p2] - primeArray[p1] < num {
        p2 += 1
    } else if primeArray[p2] - primeArray[p1] > num {
        p1 += 1
    } else {
        result += 1
        p2 += 1
    }
}

print(result)

// 에라토스테네스의 체로 소수 배열 만들기
func makePrimeArray(_ num: Int) -> [Int] {
    var nums = [Int](repeating: 0, count: num + 1)
    var result = [Int]()
    
    for i in 2...num {
        nums[i] = i
    }
    
    for i in 2...num {
        if nums[i] == 0 { continue }
        var j = i + i
        while j <= num {
            nums[j] = 0
            j += i
        }
    }
    
    for i in 2...num {
        if nums[i] != 0 { result.append(nums[i]) }
    }
    
    return result
}
