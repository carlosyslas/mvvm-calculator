import UIKit

class DisplayView: UIView {
    // MARK: - Subviews
    private lazy var label: UILabel = {
        let label = UILabel()
        
        label.text = "0"
        label.font = .systemFont(ofSize: 72)
        label.textAlignment = .right
        label.textColor = Theme.dark.displayForeground
        
        return label
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
        addSubview(label)
        backgroundColor = Theme.dark.displayBackground
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        heightAnchor.constraint(equalToConstant: 250).isActive = true
        
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            label.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
    
    func setup(displayText: String) {
        label.text = displayText
    }
}
