from typing import List


class Solution:
    def canCompleteCircuit(self, gas: List[int], cost: List[int]) -> int:
        gas_sum = sum(gas)
        cost_sum = sum(cost)
        if gas_sum < cost_sum:
            return -1
        start = 0
        curr = 0
        for i in range(len(gas)):
            curr += gas[i] - cost[i]
            if curr < 0:
                curr = 0
                start = i + 1
        return start
