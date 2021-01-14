from typing import List


# Definition for a binary tree node.
class TreeNode:
    def __init__(self, val=0, left=None, right=None):
        self.val = val
        self.left = left
        self.right = right


class Solution:
    def buildTree(self, preorder: List[int], inorder: List[int]) -> TreeNode:
        map = {}
        for i, n in enumerate(inorder):
            map[n] = i

        def helper(l, r: int):
            if l == r:
                return None
            val = preorder[self.curr_idx]
            root = TreeNode(val)
            index = map[val]
            self.curr_idx += 1
            root.left = helper(l, index)
            root.right = helper(index + 1, r)
            return root

        self.curr_idx = 0
        return helper(0, len(preorder))
