from typing import List


class Solution:
    def triangleNumber(self, nums: List[int]) -> int:
        n = len(nums)
        if n < 3:
            return 0
        res = 0
        nums.sort()
        for i in range(n - 2):
            k = i + 2
            for j in range(i + 1, n - 1):
                if nums[i] == 0:
                    break
                while k < n and nums[i] + nums[j] > nums[k]:
                    k += 1
                res += k - j - 1
        return res
