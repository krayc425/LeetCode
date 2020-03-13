class Solution {
    let bToHdict: [String: String] = [
        "0000" : "0",
        "0001" : "1",
        "0010" : "2",
        "0011" : "3",
        "0100" : "4",
        "0101" : "5",
        "0110" : "6",
        "0111" : "7",
        "1000" : "8",
        "1001" : "9",
        "1010" : "a",
        "1011" : "b",
        "1100" : "c",
        "1101" : "d",
        "1110" : "e",
        "1111" : "f",
    ]
    
    func toHex(_ num: Int) -> String {
        if num == 0 {
            return "0"
        }
        let isNeg = num < 0
        var num = abs(num)
        var binaryString = ""
        while num > 0 {
            binaryString += String(num % 2)
            num /= 2
        }
        binaryString = String(binaryString.reversed())
        print(binaryString)
        return ""
    }
}

Solution().toHex(-8)
