class BrowserHistory {

    var currIdx: Int
    var maxIdx: Int
    var history: [String]
    
    init(_ homepage: String) {
        history = [homepage]
        currIdx = 0
        maxIdx = 0
    }
    
    func visit(_ url: String) {
        if currIdx == history.count - 1 {
            history.append(url)
        } else {
            history[currIdx + 1] = url
        }
        currIdx += 1
        maxIdx = currIdx
    }
    
    func back(_ steps: Int) -> String {
        currIdx = max(currIdx - steps, 0)
        return history[currIdx]
    }
    
    func forward(_ steps: Int) -> String {
        currIdx = min(currIdx + steps, maxIdx)
        return history[currIdx]
    }
    
}
