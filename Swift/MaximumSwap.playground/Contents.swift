class Solution {
    func maximumSwap(_ num: Int) -> Int {
        var last: [String: Int] = [:]
        var numStringArray = Array(String(num)).map { String($0) }
        for i in 0..<numStringArray.count {
            last[numStringArray[i]] = i
        }
        for index in 0..<numStringArray.count {
            for digit in (0...9).reversed() {
                if let lastIndex = last[String(digit)],
                    let currDigit = Int(numStringArray[index]),
                    lastIndex > index && digit > currDigit {
                    numStringArray.swapAt(index, lastIndex)
                    return numStringArray.reduce(0) { (res, chr) -> Int in
                        var tmp = res * 10
                        tmp += Int(chr)!
                        return tmp
                    }
                }
            }
        }
        return num
    }
}

Solution().maximumSwap(10)
