class Solution {
    func addBinary(_ a: String, _ b: String) -> String {
        var ta = a
        var tb = b
        if a.count < b.count {
            for _ in 0..<(b.count - a.count) {
                ta = "0" + ta
            }
        }
        if a.count > b.count {
            for _ in 0..<(a.count - b.count) {
                tb = "0" + tb
            }
        }
        var result = ""
        var carry = false
        for i in 0..<ta.count {
            let aLastChar = ta[ta.index(ta.startIndex, offsetBy: ta.count - i - 1)]
            let bLastChar = tb[tb.index(tb.startIndex, offsetBy: tb.count - i - 1)]
            if aLastChar == bLastChar {
                if carry {
                    result += "1"
                    if aLastChar == "0" {
                        carry = false
                    }
                } else {
                    result += "0"
                    if aLastChar == "1" {
                        carry = true
                    }
                }
            } else {
                if carry {
                    result += "0"
                } else {
                    result += "1"
                }
            }
        }
        if carry {
            result += "1"
        }
        return String(result.reversed())
    }
    
}

Solution().addBinary("10010001", "10100")
