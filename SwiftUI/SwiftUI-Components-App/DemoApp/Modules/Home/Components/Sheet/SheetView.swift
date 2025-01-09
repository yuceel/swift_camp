import UIKit

class SheetView: UIViewController, SheetViewProtocol {
    var presenter: SheetPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupButton()
        setupBackButton()
    }
    
    // Setup for the main button in the center
    private func setupButton() {
        let button = UIButton(type: .system)
        button.setTitle("Show Sheet View", for: .normal)
        button.addTarget(self, action: #selector(showBottomSheet), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(button)
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

    // Setup for the back button in the top-left corner
    private func setupBackButton() {
        let backButton = UIButton(type: .system)
        backButton.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        backButton.tintColor = .blue
        backButton.addTarget(self, action: #selector(goBack), for: .touchUpInside)
        backButton.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(backButton)
        NSLayoutConstraint.activate([
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            backButton.widthAnchor.constraint(equalToConstant: 40),
            backButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    @objc private func showBottomSheet() {
        presenter?.showBottomSheet()
    }
    
    @objc private func goBack() {
        presenter?.goBack()
    }
    
    // SheetViewProtocol gerekliliklerini uygulayın
    func updateView(with data: String) {
        print("Data received in view: \(data)")
    }
}
