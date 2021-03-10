protocol EditProfilePresenterType {
    func submit()
    func evaluate(nickname: String)
    func evaluate(favoriteThing: String)
    func attach(to viewController: EditProfileViewControllerType)
}

class EditProfilePresenter {
    private var profile: Profile
    private let profileValidator: ProfileValidatorType
    private let submitStuff: EditProfileSubmitStuffType
    private weak var viewController: EditProfileViewControllerType?
    
    init(profile: Profile,
         profileValidator: ProfileValidatorType,
         submitStuff: EditProfileSubmitStuffType,
         viewController: EditProfileViewControllerType? = nil) {
        self.profile = profile
        self.profileValidator = profileValidator
        self.submitStuff = submitStuff
        self.viewController = viewController
    }
}

extension EditProfilePresenter: EditProfilePresenterType {
    func submit() {
        submitStuff
            .finishEditing(profile: profile) { [weak self] in
                self?.viewController?.didFinishEditingProfile()
            } onFailure: { [weak self] error in
                self?.viewController?.showSubmissionError(error)
            }
    }
    
    func evaluate(nickname: String) {
        profile = Profile(nickname: nickname, favoriteThing: profile.favoriteThing)
        guard case .something = profileValidator.validate(profile: profile) else { return }
        viewController?.showNicknameError()
    }
    
    func evaluate(favoriteThing: String) {
        profile = Profile(nickname: profile.nickname, favoriteThing: favoriteThing)
        guard case .otherThing = profileValidator.validate(profile: profile) else { return }
        viewController?.showFavoriteThingError()
    }
    
    func attach(to viewController: EditProfileViewControllerType) {
        viewController.setup(with: profile)
        self.viewController = viewController
    }
}

extension EditProfilePresenter {
    static func make() -> EditProfilePresenter {
        return EditProfilePresenter(profile: Profile(nickname: "name",
                                                     favoriteThing: "shrek"),
                                    profileValidator: ProfileValidator(),
                                    submitStuff: EditProfileSubmitStuff())
    }
}
