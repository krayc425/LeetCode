from typing import List


class Solution:
    def jump(self, nums: List[int]) -> int:
        n = len(nums)
        if n < 2:
            return 0
        res = 1
        max_pos = nums[0]
        max_steps = nums[0]
        for i in range(1, n):
            if i > max_steps:
                res += 1
                max_steps = max_pos
            max_pos = max(max_pos, i + nums[i])
        return res
