import UIKit

class NumpadView: UIView {
    // MARK: - Delegate
    var delegate: NumpadViewDelegate?
    
    // MARK: - Subviews
    private lazy var firstRow: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [
            createButton(inputType: .operatorr(ot: .clear), backgroundColor: Theme.dark.numberLightButtonBackground),
            createButton(inputType: .operatorr(ot: .negate), backgroundColor: Theme.dark.numberLightButtonBackground),
            createButton(inputType: .operatorr(ot: .percentage), backgroundColor: Theme.dark.numberLightButtonBackground),
            createButton(inputType: .operatorr(ot: .divide), backgroundColor: Theme.dark.accentButtonBackground),
        ])
        
        stack.axis = .horizontal
        stack.spacing = 10
        stack.distribution = .fillEqually
        
        return stack
    }()
    
    private lazy var secondRow: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [
            createButton(inputType: .number(value: 7)),
            createButton(inputType: .number(value: 8)),
            createButton(inputType: .number(value: 9)),
            createButton(inputType: .operatorr(ot: .multiply), backgroundColor: Theme.dark.accentButtonBackground),
        ])
        
        stack.axis = .horizontal
        stack.spacing = 10
        stack.distribution = .fillEqually
        
        return stack
    }()
    
    private lazy var thirdRow: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [
            createButton(inputType: .number(value: 4)),
            createButton(inputType: .number(value: 5)),
            createButton(inputType: .number(value: 6)),
            createButton(inputType: .operatorr(ot: .subtract), backgroundColor: Theme.dark.accentButtonBackground),
        ])
        
        stack.axis = .horizontal
        stack.spacing = 10
        stack.distribution = .fillEqually
        
        return stack
    }()
    
    private lazy var fourthRow: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [
            createButton(inputType: .number(value: 1)),
            createButton(inputType: .number(value: 2)),
            createButton(inputType: .number(value: 3)),
            createButton(inputType: .operatorr(ot: .add), backgroundColor: Theme.dark.accentButtonBackground),
        ])
        
        stack.axis = .horizontal
        stack.spacing = 10
        stack.distribution = .fillEqually
        
        return stack
    }()
    
    private lazy var fifthRow: UIStackView = {
        let innerStack = UIStackView(arrangedSubviews: [
            createButton(inputType: .decimal),
            createButton(inputType: .operatorr(ot: .equal), backgroundColor: Theme.dark.accentButtonBackground),
        ])
        
        
        let outerStack = UIStackView(arrangedSubviews: [
            createButton(inputType: .number(value: 0), span: .twoColumns),
            innerStack,
        ])
        
        [innerStack, outerStack].forEach { stack in
            stack.axis = .horizontal
            stack.distribution = .fillEqually
            stack.spacing = 10
        }
        
        return outerStack
    }()
    
    private lazy var vStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [
            firstRow,
            secondRow,
            thirdRow,
            fourthRow,
            fifthRow,
        ])
        
        stack.axis = .vertical
        //stack.distribution = .fillEqually
        stack.spacing = 10
        
        return stack
    }()
    
    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Layout
    private func layout() {
        addSubview(vStack)
        
        vStack.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            vStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            vStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            vStack.topAnchor.constraint(equalTo: topAnchor),
        ])
    }
    
    // MARK: - Factory methods
    private func createButton(
        inputType: InputType,
        span: CalculatorButton.Span = .oneColumn,
        backgroundColor: UIColor = Theme.dark.numberButtonBackground
    ) -> CalculatorButton {
        let button = CalculatorButton(inputType: inputType, span: span, backcgroundColor: backgroundColor)
        
        button.addTarget(self, action: #selector(handleButtonPressed), for: .touchUpInside)
        
        return button
    }
    
    // MARK: - Handlers
    @objc private func handleButtonPressed(sender: CalculatorButton) throws {
        switch sender.inputType {
        case .number(let value):
            self.delegate?.numpadViewNumberPressed(number: value)
        case .decimal:
            self.delegate?.numpadViewDecimalPressed()
        case .operatorr(let ot):
            self.delegate?.numpadViewOperatorPressed(operatorType: ot)
        }
    }
}

// MARK: - Delegate
protocol NumpadViewDelegate {
    func numpadViewNumberPressed(number: Int)
    func numpadViewOperatorPressed(operatorType: OperatorType)
    func numpadViewDecimalPressed()
}
