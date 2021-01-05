class TrieNode:

    def __init__(self):
        self.children = {}
        self.isEnd = False

    def containsKey(self, ch: str):
        return ch in self.children

    def getNode(self, ch: str):
        return self.children[ch]

    def putNode(self, ch: str, node):
        self.children[ch] = node

    def setIsEnd(self):
        self.isEnd = True

    def getIsEnd(self):
        return self.isEnd


class Trie:

    def __init__(self):
        """
        Initialize your data structure here.
        """
        self.root = TrieNode()

    def insert(self, word: str) -> None:
        """
        Inserts a word into the trie.
        """
        node = self.root
        for ch in word:
            if not node.containsKey(ch):
                node.putNode(ch, TrieNode())
            node = node.getNode(ch)
        node.setIsEnd()

    def searchPrefix(self, prefix: str) -> TrieNode:
        node = self.root
        for ch in prefix:
            if node.containsKey(ch):
                node = node.getNode(ch)
            else:
                node = None
                break
        return node

    def search(self, word: str) -> bool:
        """
        Returns if the word is in the trie.
        """
        node = self.searchPrefix(word)
        return node is not None and node.isEnd

    def startsWith(self, prefix: str) -> bool:
        """
        Returns if there is any word in the trie that starts with the given prefix.
        """
        return self.searchPrefix(prefix) is not None

# Your Trie object will be instantiated and called as such:
# obj = Trie()
# obj.insert(word)
# param_2 = obj.search(word)
# param_3 = obj.startsWith(prefix)
