class Solution {
    func judgePoint24(_ nums: [Int]) -> Bool {
        return backtrack(nums.map { Double($0) })
    }
    
    func backtrack(_ nums: [Double]) -> Bool {
        guard let first = nums.first else {
            return false
        }
        if nums.count == 1 {
            return abs(first - 24.0) < 1e-3
        }
        for i in 0..<nums.count {
            for j in 0..<nums.count where j != i {
                var innerNums: [Double] = []
                for k in 0..<nums.count where k != i && k != j {
                    innerNums.append(nums[k])
                }
                for k in 0..<4 {
                    if k < 2 && j > i {
                        continue
                    }
                    switch k {
                    case 0:
                        innerNums.append(nums[i] + nums[j])
                    case 1:
                        innerNums.append(nums[i] * nums[j])
                    case 2:
                        innerNums.append(nums[i] - nums[j])
                    case 3:
                        if nums[j] != 0 {
                            innerNums.append(nums[i] / nums[j])
                        } else {
                            continue
                        }
                    default:
                        continue
                    }
                    if backtrack(innerNums) {
                        return true
                    }
                    innerNums.removeLast()
                }
            }
        }
        return false
    }
}
