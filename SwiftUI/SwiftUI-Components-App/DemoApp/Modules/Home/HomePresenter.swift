import Combine
import Foundation

final class HomePresenter: ObservableObject {

    // MARK: - Private properties -

    private let wireframe: HomeWireframeInterface

    // MARK: - Lifecycle -

    init(wireframe: HomeWireframeInterface) {
        self.wireframe = wireframe
    }

    /// Navigates to VStackView
    func showVStack() {
        wireframe.showVStack()
    }

    /// Navigates to ZStackView
    func showZStack() {
        wireframe.showZStack()
    }

    /// Navigates to ContentView
    func showContentView() {
        wireframe.showContentView()
    }

    /// Navigates to ColorPickerView
    func showColorPicker() {
        wireframe.showColorPicker()
    }

    /// Navigates to RectangleView
    func showRectangle() {
        wireframe.showRectangle()
    }

    /// Navigates to VStackView
    func showHStack() {
        wireframe.showHStack()
    }
    /// Navigates to NavigationStackView
    func showNavigationStack() {
        wireframe.showNavigationStack()
    }

    /// Navigates to FrameView
    func showFrame() {
        wireframe.showFrame()
    }
    
    /// Navigates to ScrollView
    func showScrollView() {
        wireframe.showScrollView()
    }
    
    /// Navigates to NavigationView
    func showNavigationView() {
        wireframe.showNavigationView()
    }
    
    /// Navigates to TransactionView
    func showTransaction(){
        wireframe.showTransaction()
    }
    
    /// Navigates to TabView
    func showTabView(){
        wireframe.showTabView()
    }
    
    /// Navigates to AttributedText
    func showAttributedText(){
        wireframe.showAttributedText()
    }
    
    /// Navigates to Button
    func showButton(){
        wireframe.showButton()
    }
    
    /// Navigates to DatePicker
    func showDatePicker(){
        wireframe.showDatePicker()
    }
    
    /// Navigates to SegmentedControl
    func showSegmentedControl(){
        wireframe.showSegmentedControl()
    }
    
    /// Navigates to RoundedRectagle
    func showRaundedRectagle(){
        wireframe.showRoundedRectangle()
    }
    
    /// Navigates to Shadow
    func showShadow(){
        wireframe.showShadow()
    }

    /// Navigates to ScaleEffect
    func showScaleEffect(){
        wireframe.showScaleEffect()
    }
    
    /// Navigates to Animation
    func showAnimation(){
        wireframe.showAnimation()
    }
    
}
