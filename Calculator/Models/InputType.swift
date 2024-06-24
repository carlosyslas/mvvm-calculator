import Foundation

enum InputType {
    case number(value: Int)
    case decimal
    case operatorr(ot: OperatorType)
    
    var label: String {
        switch self {
        case .number(let value):
            String(value)
        case .decimal:
            "."
        case .operatorr(let ot):
            ot.label
        }
    }
}
