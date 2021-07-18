func d(n:Int) -> Int{
    if n == 10000   {return 10001}
    else if n>=1000 {return n + n/1000 + n%1000/100 + n%100/10 + n%10}
    else if n>=100  {return n + n/100 + n%100/10 + n%10}
    else if n>=10   {return n + n/10 + n%10}
    else    {return n + n}
    
}

var selfNum = [Bool](repeating: true, count: 10000)

for i in 1...10000{
    if d(n: i) <= 10000{
        selfNum[d(n: i)-1]=false
    }
    else{
        continue
    }
}

for i in 0..<10000{
    if selfNum[i]{
        print(i+1)
    }
}
