class Solution {
    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
        guard !numbers.isEmpty else {
            return []
        }
        var head = 0
        var rear = numbers.count - 1
        while head < rear {
            if numbers[head] + numbers[rear] < target {
                head += 1
            } else if numbers[head] + numbers[rear] > target {
                rear -= 1
            } else {
                break
            }
        }
        return [head + 1, rear + 1]
    }
}

print(Solution().twoSum([2,7,11,15], 18))
