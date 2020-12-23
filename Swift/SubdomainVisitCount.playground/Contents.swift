class Solution {
    func subdomainVisits(_ cpdomains: [String]) -> [String] {
        guard !cpdomains.isEmpty else {
            return []
        }
        var map: [String: Int] = [:]
        for cp in cpdomains {
            let cpPair = cp.split(separator: " ")
            let count = Int(cpPair[0])!
            let domain = cpPair[1]
            let subDomains = domain.split(separator: ".")
            for i in 0..<subDomains.count {
                map[subDomains[i...].joined(separator: "."), default: 0] += count
            }
        }
        var res: [String] = []
        for (k, v) in map {
            res.append("\(v) \(k)")
        }
        return res
    }
}
