protocol EditProfilePresenterType {
    func submit(profile: Profile)
    func evaluate(nickname: String)
    func evaluate(favoriteThing: String)
    func attach(to viewController: EditProfileViewControllerType)
}

class EditProfilePresenter {
    private weak var viewController: EditProfileViewControllerType?
    private let profileValidator: ProfileValidatorType
    private let submitStuff: EditProfileSubmitStuffType
    
    init(viewController: EditProfileViewControllerType? = nil,
         profileValidator: ProfileValidatorType,
         submitStuff: EditProfileSubmitStuffType) {
        self.viewController = viewController
        self.profileValidator = profileValidator
        self.submitStuff = submitStuff
    }
}

extension EditProfilePresenter: EditProfilePresenterType {
    func submit(profile: Profile) {
        submitStuff
            .finishEditing(profile: profile) {
                self.viewController?.didFinishEditingProfile()
            } onFailure: { error in
                self.viewController?.showSubmissionError(error)
            }
    }
    
    func evaluate(nickname: String) {
        guard let _ = profileValidator.validate(nickname: nickname) else { return }
        viewController?.showNicknameError()
    }
    
    func evaluate(favoriteThing: String) {
        guard let _ = profileValidator.validate(favoriteThing: favoriteThing) else { return }
        viewController?.showFavoriteThingError()
    }
    
    func attach(to viewController: EditProfileViewControllerType) {
        self.viewController = viewController
    }
}
