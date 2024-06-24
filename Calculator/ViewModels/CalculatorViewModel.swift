import Foundation

class CalculatorViewModel {
    private(set) var input: [InputType] {
        didSet {
            if let onDisplayUpdate = self.onDisplayUpdate {
                onDisplayUpdate(log)
            }
        }
    }
    var onDisplayUpdate: ((_ displayText: String) -> ())?
    
    init(input: [InputType]) {
        self.input = input
    }
    
    func addInput(input: InputType) {
        switch input {
        case .number(_):
            self.input.append(input)
        case .decimal:
            self.input.append(input)
        case .operatorr(let ot):
            if ot == OperatorType.clear {
                self.input = []
            }
            else {
                self.input.append(input)
            }
        }
    }
    
    var log: String {
        let chunks: [String] = input.map { input in
            input.label
        }
        
        return chunks.joined(separator: " ")
    }
}
