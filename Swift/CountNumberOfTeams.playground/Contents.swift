class Solution {
    func numTeams(_ rating: [Int]) -> Int {
        guard rating.count >= 3 else {
            return 0
        }
        var res = 0
        for (idx, num) in rating.enumerated() {
            var leftSmaller = 0, leftLarger = 0
            for i in 0..<idx {
                if rating[i] < num {
                    leftSmaller += 1
                } else if rating[i] > num {
                    leftLarger += 1
                }
            }
            var rightSmaller = 0, rightLarger = 0
            for i in (idx + 1)..<rating.count {
                if rating[i] < num {
                    rightSmaller += 1
                } else if rating[i] > num {
                    rightLarger += 1
                }
            }
            res += leftSmaller * rightLarger + leftLarger * rightSmaller
        }
        return res
    }
}
