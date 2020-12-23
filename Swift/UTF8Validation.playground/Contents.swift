class Solution {
    func validUtf8(_ data: [Int]) -> Bool {
        var pending = 0
        for d in data {
            if pending > 0 {
                if d >> 6 != 0b10 {
                    return false
                }
                pending -= 1
            } else {
                if d >> 7 == 0 {
                    continue     //  first bit should be  0
                } else if d >> 5 == 0b110 {
                    pending = 1    // first 3 bits should be  110
                } else if d >> 4 == 0b1110 {
                    pending = 2     // first 4 bits should be  1110
                } else if d >> 3 == 0b11110 {
                    pending = 3    // first 5 bits should be  11110
                } else {
                    return false
                }
            }
        }
        return pending == 0
    }
}

Solution().validUtf8([235, 140, 4])
