from typing import List


# Definition for a binary tree node.
class TreeNode:
    def __init__(self, val=0, left=None, right=None):
        self.val = val
        self.left = left
        self.right = right


class Solution:
    def buildTree(self, inorder: List[int], postorder: List[int]) -> TreeNode:
        map = {}
        for idx, num in enumerate(inorder):
            map[num] = idx

        def helper(left: int, right: int):
            if left > right:
                return None
            val = postorder.pop()
            root = TreeNode(val)
            index = map[val]
            root.right = helper(index + 1, right)
            root.left = helper(left, index - 1)
            return root

        return helper(0, len(inorder) - 1)
