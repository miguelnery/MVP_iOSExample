import UIKit
import SnapKit


protocol EditProfileViewControllerType: class {
    func showNicknameError()
    func showFavoriteThingError()
    func showSubmissionError(_ error: ProfileValidationError)
    func didFinishEditingProfile()
}

class EditProfileViewController: UIViewController {
    private let presenter: EditProfilePresenterType
    private let loginView = EditProfileView()
    private unowned let delegate: EditProfileViewControllerDelegate
    
    init(presenter: EditProfilePresenterType,
         delegate: EditProfileViewControllerDelegate) {
        self.presenter = presenter
        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = loginView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
    }
}

extension EditProfileViewController: EditProfileViewControllerType {
    func showNicknameError() {
        print("error on nickname field")
    }
    
    func showFavoriteThingError() {
        print("error on nickname field")
    }
    
    func showSubmissionError(_ error: ProfileValidationError) {
        print("naughty error with submission: \(error)")
    }
    
    func didFinishEditingProfile() {
        delegate.didFinishEditing()
    }
}

protocol EditProfileViewControllerDelegate: class {
    func didFinishEditing()
}
