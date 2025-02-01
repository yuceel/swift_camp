import UIKit

// MARK: - ToastHelperProtocol
protocol ToastHelperProtocol {
    func showToast(
        in view: UIView,
        title: String,
        type: ToastType,
        duration: TimeInterval
    )
}

// MARK: - ToastType Enum
enum ToastType {
    case success
    case error
    case warning
    case info
    case custom(backgroundColor: UIColor, textColor: UIColor, icon: UIImage?)

    var backgroundColor: UIColor {
        switch self {
        case .success: return .systemGreen
        case .error: return .systemRed
        case .warning: return .systemOrange
        case .info: return .systemBlue
        case .custom(let backgroundColor, _, _): return backgroundColor
        }
    }

    var textColor: UIColor {
        switch self {
        case .custom(_, let textColor, _): return textColor
        default: return .white
        }
    }

    var icon: UIImage? {
        switch self {
        case .success: return UIImage(systemName: "checkmark.circle")
        case .error: return UIImage(systemName: "xmark.octagon")
        case .warning: return UIImage(systemName: "exclamationmark.triangle")
        case .info: return UIImage(systemName: "info.circle")
        case .custom(_, _, let icon): return icon
        }
    }
}

// MARK: - ToastView
class ToastView: UIView {
    init(title: String, type: ToastType) {
        super.init(frame: .zero)

        // Set background color and corner radius
        backgroundColor = type.backgroundColor
        layer.cornerRadius = 12
        layer.masksToBounds = true

        // Icon
        let iconImageView = UIImageView(image: type.icon)
        iconImageView.tintColor = type.textColor
        iconImageView.contentMode = .scaleAspectFit
        iconImageView.translatesAutoresizingMaskIntoConstraints = false

        // Title label
        let titleLabel = UILabel()
        titleLabel.text = title
        titleLabel.textColor = type.textColor
        titleLabel.font = .boldSystemFont(ofSize: 16)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false

        // Layout using stack view
        let stackView = UIStackView(arrangedSubviews: [iconImageView, titleLabel])
        stackView.axis = .horizontal
        stackView.spacing = 16
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false

        addSubview(stackView)

        // Auto layout constraints
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12),

            iconImageView.widthAnchor.constraint(equalToConstant: 24),
            iconImageView.heightAnchor.constraint(equalToConstant: 24)
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - ToastHelper
class ToastHelper: ToastHelperProtocol {
    // MARK: - Singleton Instance
    static let shared = ToastHelper()

    // MARK: - Private Initializer
    private init() {}

    // MARK: - Public Method to Show Toast
    func showToast(
        in view: UIView,
        title: String,
        type: ToastType,
        duration: TimeInterval = 3.0
    ) {
        let toastView = ToastView(title: title, type: type)
        toastView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(toastView)

        // Initial position of the toast (outside the bottom edge)
        NSLayoutConstraint.activate([
            toastView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            toastView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            toastView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 70)
        ])

        // Animate the toast into view
        view.layoutIfNeeded()
        UIView.animate(withDuration: 0.3) {
            toastView.transform = CGAffineTransform(translationX: 0, y: -120)
        }

        // Hide the toast after the specified duration
        DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
            UIView.animate(withDuration: 0.3, animations: {
                toastView.transform = .identity
                toastView.alpha = 0
            }) { _ in
                toastView.removeFromSuperview()
            }
        }
    }
}
