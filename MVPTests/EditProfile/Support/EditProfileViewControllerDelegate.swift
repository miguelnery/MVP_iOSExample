@testable import MVP

class EditProfileViewControllerDelegateMock: EditProfileViewControllerDelegate {
    var didCallDidFinishEditing = false
    
    func didFinishEditing() {
        didCallDidFinishEditing = true
    }
}
