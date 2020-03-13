enum LogType {
    case letter
    case digit
}

struct Log {
    var identifier: String
    var type: LogType
    var value: String
    var origin: String
    
    init(_ s: String) {
        let idx = s.firstIndex(of: " ")!
        self.identifier = String(s.prefix(upTo: idx))
        self.value = String(s.suffix(from: idx))
        self.type = s.last!.isNumber ? LogType.digit : LogType.letter
        self.origin = s
    }
}

class Solution {
    func reorderLogFiles(_ logs: [String]) -> [String] {
        let logs = logs.map { Log($0) }
        var letters = logs.filter { $0.type == .letter }
        let digits = logs.filter { $0.type == .digit }
        letters.sort { (s1, s2) -> Bool in
            s1.value == s2.value ? s1.identifier < s2.identifier : s1.value < s2.value
        }
        return letters.map { $0.origin } + digits.map { $0.origin }
    }
}
