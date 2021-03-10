import UIKit
import SnapKit


protocol EditProfileViewControllerType: class {
    func setup(with profile: Profile)
    func showNicknameError()
    func showFavoriteThingError()
    func showSubmissionError(_ error: ProfileValidationError)
    func didFinishEditingProfile()
}

protocol EditProfileViewControllerDelegate: class {
    func didFinishEditing()
}

class EditProfileViewController: UIViewController {
    private let presenter: EditProfilePresenterType
    private lazy var editProfileView = EditProfileView(delegate: self)
    private unowned let delegate: EditProfileViewControllerDelegate
    
    init(delegate: EditProfileViewControllerDelegate,
         presenter: EditProfilePresenterType) {
        self.delegate = delegate
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
        self.presenter.attach(to: self)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = editProfileView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
    }
}

extension EditProfileViewController: EditProfileViewControllerType {
    func setup(with profile: Profile) {
        editProfileView.setup(with: profile)
    }
    
    func showNicknameError() {
        print("error on nickname field")
    }
    
    func showFavoriteThingError() {
        print("error on favorite thing field")
    }
    
    func showSubmissionError(_ error: ProfileValidationError) {
        print("naughty error with submission: \(error)")
    }
    
    func didFinishEditingProfile() {
        delegate.didFinishEditing()
    }
}

extension EditProfileViewController: EditProfileViewDelegate {
    func didTapSubmitButton() {
        presenter.submit()
    }
    
    func didEditTextfield(identifiedBy fieldId: EditProfileView.FieldIdentifier, text: String) {
        switch fieldId {
        case .nickName:
            presenter.evaluate(nickname: text)
        case .favoriteThing:
            presenter.evaluate(favoriteThing: text)
        }
    }
}
