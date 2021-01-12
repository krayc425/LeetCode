from typing import List


class Solution:
    def threeSumClosest(self, nums: List[int], target: int) -> int:
        n = len(nums)
        if n < 3:
            return 0
        res = []
        nums.sort()
        min_diff = float('inf')
        for i in range(n - 2):
            j = i + 1
            k = n - 1
            while j < k:
                sum = nums[i] + nums[j] + nums[k]
                if sum > target:
                    k -= 1
                elif sum < target:
                    j += 1
                else:
                    return target
                if abs(sum - target) < min_diff:
                    min_diff = abs(sum - target)
                    res = sum
        return res
