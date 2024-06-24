import Foundation

enum OperatorType {
    case divide
    case multiply
    case add
    case subtract
    case percentage
    case negate
    case equal
    case clear
    
    var label: String {
        switch self {
        case .divide:
            "÷"
        case .multiply:
            "x"
        case .add:
            "+"
        case .subtract:
            "-"
        case .percentage:
            "%"
        case .negate:
            "±"
        case .equal:
            "="
        case .clear:
            "C"
        }
    }
}
