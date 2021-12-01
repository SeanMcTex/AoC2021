import UIKit
import Algorithms

// read and parse data
let fileURL = Bundle.main.url(forResource: "Input", withExtension: "txt")
let content = try String(contentsOf: fileURL!, encoding: String.Encoding.utf8)
let contentArray = content.split(separator: "\n").compactMap { Int($0) }

// part 1
let pairs = contentArray.windows(ofCount: 2)
print(tallyIncreasingPairs(pairs))

// part 2
let dataWindows = contentArray.windows(ofCount: 3)
let dataWindowSums = dataWindows.map { $0.reduce(0, +) }
let sumPairs = dataWindowSums.windows(ofCount: 2)
print(tallyIncreasingPairs(sumPairs))

func tallyIncreasingPairs( _ pairs: Windows<[Int]>) -> Int {
    pairs.reduce(0) { partialResult, pair in
        let increase = pair.last! > pair.first! ? 1 : 0
        return partialResult + increase
    }
}
