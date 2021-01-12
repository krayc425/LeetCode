from collections import defaultdict


# Definition for a binary tree node.
class TreeNode:
    def __init__(self, val=0, left=None, right=None):
        self.val = val
        self.left = left
        self.right = right


class Solution:
    def pathSum(self, root: TreeNode, sum: int) -> int:
        self.res = 0
        map = defaultdict(int)
        map[0] = 1

        def dfs(node: TreeNode, prev_sum: int):
            if not node:
                return
            curr_sum = prev_sum + node.val
            self.res += map[curr_sum - sum]
            map[curr_sum] += 1
            dfs(node.left, curr_sum)
            dfs(node.right, curr_sum)
            map[curr_sum] -= 1

        dfs(root, 0)
        return self.res
