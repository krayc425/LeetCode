class Solution {
    
    func canIWin(_ maxChoosableInteger: Int, _ desiredTotal: Int) -> Bool {
        if Array(1...maxChoosableInteger).reduce(0, +) < desiredTotal {
            return false
        }
        if maxChoosableInteger > desiredTotal {
            return true
        }
        var dict: [Int: Bool] = [:]
        return process(maxChoosableInteger, desiredTotal, 0, &dict)
    }
    
    private func process(_ length: Int, _ total: Int, _ used: Int, _ dict: inout [Int: Bool]) -> Bool {
        if let val = dict[used] {
            return val
        }
        for i in 1...length {
            let cur = 1 << (i - 1)
            if cur & used == 0 {
                if total <= i || !process(length, total - i, cur | used, &dict) {
                    dict[used] = true
                    return true
                }
            }
        }
        dict[used] = false
        return false
    }
    
}
