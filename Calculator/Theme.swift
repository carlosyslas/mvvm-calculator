import UIKit

struct Theme {
    let background: UIColor
    let displayBackground: UIColor
    let displayForeground: UIColor
    let buttonForeground: UIColor
    let numberButtonBackground: UIColor
    let numberLightButtonBackground: UIColor
    let accentButtonBackground: UIColor
    
    static let dark: Theme = {
        let theme = Theme(
            background: .init(hex: "#17181aff")!,
            displayBackground: .init(hex: "#17181aff")!,
            displayForeground: .init(hex: "#ffffffff")!,
            buttonForeground: .init(hex: "#eeeeeeff")!,
            numberButtonBackground: .init(hex: "#232428ff")!,
            numberLightButtonBackground: .init(hex: "#383B42ff")!,
            accentButtonBackground: .init(hex: "#ff9505ff")!
        )
        
        return theme
    }()
}
