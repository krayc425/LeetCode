from typing import List


# Definition for a binary tree node.
class TreeNode:
    def __init__(self, val=0, left=None, right=None):
        self.val = val
        self.left = left
        self.right = right


class Solution:
    def pathSum(self, root: TreeNode, sum: int) -> List[List[int]]:
        if not root:
            return []
        res = []

        def dfs(node: TreeNode, sum: int, temp: List[int], result: List[List[int]]):
            if not node:
                return
            temp.append(node.val)
            if sum == node.val and not node.left and not node.right:
                result.append(temp[:])
            else:
                dfs(node.left, sum - node.val, temp, result)
                dfs(node.right, sum - node.val, temp, result)
            temp.pop()

        dfs(root, sum, [], res)
        return res
