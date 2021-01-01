from typing import List


class Solution:
    def findMissingRanges(self, nums: List[int], lower: int, upper: int) -> List[str]:
        res = []
        if len(nums) == 0 or lower - 1 != nums[0]:
            nums = [lower - 1] + nums
        if len(nums) == 0 or upper + 1 != nums[-1]:
            nums = nums + [upper + 1]
        for i in range(1, len(nums)):
            if nums[i] - nums[i - 1] != 1:
                l, r = nums[i - 1] + 1, nums[i] - 1
                if l == r:
                    res.append(str(l))
                else:
                    res.append(str(l) + "->" + str(r))
        return res
