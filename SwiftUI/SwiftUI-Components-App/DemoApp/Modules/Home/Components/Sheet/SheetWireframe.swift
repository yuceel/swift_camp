import UIKit

class SheetWireframe: BaseWireframe<UIViewController>, SheetWireframeProtocol {
    // MARK: - Initializer
    init() {
        let view = SheetView()
        super.init(viewController: view)
        
        let presenter = SheetPresenter(view: view, wireframe: self)
        view.presenter = presenter
    }
    
    // MARK: - Navigation Methods
    func navigateToNextScreen() {
        let nextViewController = UIViewController()
        nextViewController.view.backgroundColor = .blue
        
        // Use a navigation controller if available
        if let navigationController = viewController.navigationController {
            navigationController.pushViewController(nextViewController, animated: true)
        } else {
            viewController.present(nextViewController, animated: true, completion: nil)
        }
    }
    
    func navigateBack() {
        // Dismiss or pop the current view controller
        if let navigationController = viewController.navigationController {
            navigationController.popViewController(animated: true)
        } else {
            viewController.dismiss(animated: true, completion: nil)
        }
    }
    
    func presentBottomSheet() {
        let bottomSheet = BottomSheetViewController()
        bottomSheet.modalPresentationStyle = .pageSheet
        
        if let sheet = bottomSheet.sheetPresentationController {
            sheet.detents = [.medium(), .large()]
            sheet.preferredCornerRadius = 20
            sheet.prefersGrabberVisible = true
        }
        
        viewController.present(bottomSheet, animated: true, completion: nil)
    }
}
