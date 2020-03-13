import Foundation

class Solution {
    func constructRectangle(_ area: Int) -> [Int] {
        guard area > 0 else {
            return []
        }
        var minSum = Int.max
        var i = 1
        var w = 0
        while i <= Int(sqrt(Double(area))) {
            if area % i == 0 {
                let currSum = i + area / i
                if currSum < minSum {
                    minSum = currSum
                    w = i
                }
            }
            i += 1
        }
        return [w, area / w].sorted().reversed()
    }
}
