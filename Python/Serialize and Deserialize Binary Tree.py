# Definition for a binary tree node.
class TreeNode(object):
    def __init__(self, x):
        self.val = x
        self.left = None
        self.right = None


class Codec:
    delimiter = "_"
    none_str = "None"

    def serialize(self, root):
        """Encodes a tree to a single string.

        :type root: TreeNode
        :rtype: str
        """

        def helper(node: TreeNode, s: str):
            if not node:
                s += self.none_str + self.delimiter
            else:
                s += str(node.val) + self.delimiter
                s = helper(node.left, s)
                s = helper(node.right, s)
            return s

        return helper(root, "")

    def deserialize(self, data):
        """Decodes your encoded data to tree.

        :type data: str
        :rtype: TreeNode
        """

        def helper(strs):
            if strs[0] == self.none_str:
                strs.pop(0)
                return None
            node = TreeNode(int(strs[0]))
            strs.pop(0)
            node.left = helper(strs)
            node.right = helper(strs)
            return node

        strs = data.split(self.delimiter)
        return helper(strs)

# Your Codec object will be instantiated and called as such:
# ser = Codec()
# deser = Codec()
# ans = deser.deserialize(ser.serialize(root))
