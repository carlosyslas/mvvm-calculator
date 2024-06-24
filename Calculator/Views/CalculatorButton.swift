import UIKit

class CalculatorButton: UIButton {
    enum Span {
        case oneColumn
        case twoColumns
        
        var multiplier: Double {
            switch self {
            case .oneColumn:
                1.0
            case .twoColumns:
                0.5
            }
        }
    }
    
    private var span: Span
    var inputType: InputType
    
    init(inputType: InputType, span: Span = .oneColumn, backcgroundColor: UIColor = Theme.dark.numberButtonBackground) {
        self.span = span
        self.inputType = inputType
        
        super.init(frame: .zero)
        
        setTitle(inputType.label, for: .normal)
        self.backgroundColor = backcgroundColor
        
        layout()
        decorate()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Layout
    private func layout() {
        setTitleColor(Theme.dark.buttonForeground, for: .normal)

        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalTo: widthAnchor, multiplier: span.multiplier).isActive = true
    }
    
    // MARK: Decorate
    private func decorate() {
        // Corner radius
        layer.cornerRadius = 30
        clipsToBounds = true
        
        // Font
        titleLabel?.font = .systemFont(ofSize: 24)
    }
}
