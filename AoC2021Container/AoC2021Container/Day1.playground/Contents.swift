import UIKit

// read and parse data
let fileURL = Bundle.main.url(forResource: "Input", withExtension: "txt")
let content = try String(contentsOf: fileURL!, encoding: String.Encoding.utf8)
let contentArray = content.split(separator: "\n").compactMap { Int($0) }

// part 1
print(contentArray.ascendingTally())

extension Array where Element == Int {
    func ascendingTally() -> Int {
        var tally1 = 0

        (1..<contentArray.count).forEach { i in
            if contentArray[i] > contentArray[i-1] {
                tally1 += 1
            }
        }

        return tally1
    }
}
