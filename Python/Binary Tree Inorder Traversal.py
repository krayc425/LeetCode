from typing import List


# Definition for a binary tree node.
class TreeNode:
    def __init__(self, val=0, left=None, right=None):
        self.val = val
        self.left = left
        self.right = right


class Solution:
    def inorder(self, root: TreeNode, res: List[int]):
        if root is None:
            return
        self.inorder(root.left, res)
        res.append(root.val)
        self.inorder(root.right, res)

    def inorderTraversal(self, root: TreeNode) -> List[int]:
        if root is None:
            return []
        res = []
        self.inorder(root, res)
        return res
