from typing import List


class Solution:
    def threeSum(self, nums: List[int], target: int) -> List[List[int]]:
        n = len(nums)
        if n < 3:
            return []
        res = set()
        for i in range(n - 2):
            if i != 0 and nums[i] == nums[i - 1]:
                continue
            j = i + 1
            k = n - 1
            while j < k:
                sum = nums[i] + nums[j] + nums[k] - target
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

    def fourSum(self, nums: List[int], target: int) -> List[List[int]]:
        res = []
        nums.sort()
        for i, n in enumerate(nums):
            if i == 0 or nums[i] != nums[i - 1]:
                temp_res = self.threeSum(nums[i + 1:], target - n)
                for temp in temp_res:
                    res.append(temp + [n])
        return res
