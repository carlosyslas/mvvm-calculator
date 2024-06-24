import UIKit

class CalculatorViewController: UIViewController {
    // MARK: - ViewModel
    private var vm = CalculatorViewModel(input: [])
    
    // MARK: - Subviews
    private let display = DisplayView()
    private let numpad = NumpadView()
    
    private lazy var vStack: UIStackView = {
        var stack = UIStackView(arrangedSubviews: [
            display,
            numpad,
        ])
        
        stack.axis = .vertical
        stack.distribution = .fill
        
        return stack
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Theme.dark.background
        
        layout()
        bind()
    }
    
    // MARK: - Layout
    private func layout() {
        view.addSubview(vStack)
        
        vStack.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            vStack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            vStack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            vStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            vStack.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
    // MARK: - Binding
    private func bind() {
        numpad.delegate = self
        vm.onDisplayUpdate = { [weak self] displayText in
            self?.display.setup(displayText: displayText)
        }
    }
}


// MARK: CalculatorViewController + NumpadViewDelegate
extension CalculatorViewController: NumpadViewDelegate {
    func numpadViewNumberPressed(number: Int) {
        print(number)
        vm.addInput(input: InputType.number(value: number))
        print(vm.log)
    }
    
    func numpadViewOperatorPressed(operatorType: OperatorType) {
        print(operatorType)
        vm.addInput(input: InputType.operatorr(ot: operatorType))
        print(vm.log)
    }
    
    func numpadViewDecimalPressed() {
        print(".")
        vm.addInput(input: InputType.decimal)
        print(vm.log)
    }
}
