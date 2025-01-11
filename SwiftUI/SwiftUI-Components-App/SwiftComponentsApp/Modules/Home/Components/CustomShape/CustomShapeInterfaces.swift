protocol MyCustomShapeViewProtocol {
    func displayShape()
    func goBack()
}

protocol MyCustomShapePresenterProtocol: AnyObject {
    func viewDidLoad()
}
