import Foundation

final class TextPresenter: TextPresenterInterface, ObservableObject {
    
    // MARK: - Properties
    private let wireframe: TextWireframeInterface
    private let interactor: TextInteractorInterface
    
    @Published var displayedText: String = ""
    
    // MARK: - Initialization
    init(wireframe: TextWireframeInterface, interactor: TextInteractorInterface) {
        self.wireframe = wireframe
        self.interactor = interactor
        loadText()
    }
    
    // MARK: - TextPresenterInterface Methods
    func loadText() {
        displayedText = interactor.fetchText()
    }
    
    func goBack() {
        wireframe.goBack()
    }
}
