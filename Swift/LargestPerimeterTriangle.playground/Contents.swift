class Solution {
    func largestPerimeter(_ A: [Int]) -> Int {
        guard A.count >= 3 else {
            return 0
        }
        let arr: [Int] = A.sorted().reversed()
        for i in 0...A.count - 3 {
            if arr[i] < arr[i + 1] + arr[i + 2] {
                return arr[i] + arr[i + 1] + arr[i + 2]
            }
        }
        return 0
    }
}

Solution().largestPerimeter([2,1,2])
