from typing import List


class Solution:
    def threeSum(self, nums: List[int]) -> List[List[int]]:
        n = len(nums)
        if n < 3:
            return []
        res = set()
        nums.sort()
        for i in range(n - 2):
            j = i + 1
            k = n - 1
            while j < k:
                sum = nums[i] + nums[j] + nums[k]
                if sum > 0:
                    if nums[k] != nums[k - 1]:
                        k -= 1
                    else:
                        while j < k and nums[k] == nums[k - 1]:
                            k -= 1
                else:
                    if sum == 0:
                        res.add('_'.join([str(x) for x in [nums[i], nums[j], nums[k]]]))
                    if nums[j] != nums[j + 1]:
                        j += 1
                    else:
                        while j < k and nums[j] == nums[j + 1]:
                            j += 1
        return [[int(x) for x in r.split("_")] for r in res]
