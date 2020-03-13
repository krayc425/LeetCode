class Solution {
    func isOneBitCharacter(_ bits: [Int]) -> Bool {
        guard !bits.isEmpty else {
            return false
        }
        var i = 0
        while i < bits.count - 1 {
            if bits[i] == 1 {
                i += 2
            } else if bits[i] == 0 {
                i += 1
            }
        }
        return i == bits.count - 1
    }
}

Solution().isOneBitCharacter([1,1,1,0])
