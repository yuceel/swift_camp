class SheetPresenter: SheetPresenterProtocol {
    // MARK: - Properties
    weak var view: SheetViewProtocol?
    var wireframe: SheetWireframeProtocol?
    
    // MARK: - Initializer
    init(view: SheetViewProtocol, wireframe: SheetWireframeProtocol) {
        self.view = view
        self.wireframe = wireframe
    }
    
    // MARK: - Public Methods
    func loadData() {
        // Simulate fetching or preparing data
        let data = fetchData()
        view?.updateView(with: data)
    }
    
    func showBottomSheet() {
        // Delegate the action to the wireframe
        wireframe?.presentBottomSheet()
    }
    
    func goBack() {
        // Delegate the back navigation to the wireframe
        wireframe?.navigateBack()
    }
    
    // MARK: - Private Methods
    private func fetchData() -> String {
        // Add logic for data fetching or preparation here
        return "Data loaded successfully!"
    }
}
