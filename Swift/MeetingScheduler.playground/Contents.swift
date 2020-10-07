class Solution {
    func minAvailableDuration(_ slots1: [[Int]], _ slots2: [[Int]], _ duration: Int) -> [Int] {
        let sortedSlots = (slots1 + slots2).sorted(by: { $0[0] < $1[0] })
        for i in 0..<sortedSlots.count - 1 {
            if sortedSlots[i + 1][0] < sortedSlots[i][1] {
                let end = min(sortedSlots[i][1], sortedSlots[i + 1][1])
                if end - sortedSlots[i + 1][0] >= duration {
                    return [sortedSlots[i + 1][0], sortedSlots[i + 1][0] + duration]
                }
            }
        }
        return []
    }
}

Solution().minAvailableDuration([[10,50],[60,120],[140,210]], [[0,15],[60,70]], 8)
Solution().minAvailableDuration([[10,50],[60,120],[140,210]], [[0,15],[60,70]], 12)
