import UIKit

enum Direction: String {
    case up
    case down
    case forward
}

struct SubCommand {
    let direction: Direction
    let magnitude: Int
}

// read and parse data
let fileURL = Bundle.main.url(forResource: "Input", withExtension: "txt")
let content = try String(contentsOf: fileURL!, encoding: String.Encoding.utf8)
let contentArray: [SubCommand] = content.split(separator: "\n").compactMap {
    let components = $0.split(separator: " ")
    return SubCommand(
        direction: Direction(rawValue: String(components[0]))!,
        magnitude: Int(components[1])!
    )
}

// part 1
var distance = 0
var depth = 0

contentArray.forEach { subCommand in
    switch subCommand.direction {
    case .forward:
        distance += subCommand.magnitude
    case .up:
        depth -= subCommand.magnitude
    case .down:
        depth += subCommand.magnitude
    }
}

print(distance * depth)


