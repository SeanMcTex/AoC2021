import UIKit

// read and parse data
let fileURL = Bundle.main.url(forResource: "Input", withExtension: "txt")
let content = try String(contentsOf: fileURL!, encoding: String.Encoding.utf8)
let contentArray: [[Character]] = content.split(separator: "\n").map { Array( $0 )}
let contentSize = contentArray.first!.count

print(contentArray)

// part 1
typealias ElementSelector = (([Character: Int]) -> Dictionary<Character, Int>.Element? )

func process(contentArray: [[Character]], selector: ElementSelector) -> Int {
    let binaryString = (0..<contentSize).reduce("") { partialResult, i in
        var counts: [Character: Int] = [:]
        contentArray.forEach { element in
            let item = element[i]
            counts[item] = (counts[item] ?? 0) + 1
        }
        let returnElement = selector(counts)
        return partialResult + String(returnElement!.key)
    }
    return Int(binaryString, radix: 2)!
}


let gamma = process(contentArray: contentArray, selector: { counts in counts.max { a, b in a.value < b.value } })
let epsilon = process(contentArray: contentArray, selector: { counts in counts.min { a, b in a.value < b.value } })
print (gamma * epsilon)
