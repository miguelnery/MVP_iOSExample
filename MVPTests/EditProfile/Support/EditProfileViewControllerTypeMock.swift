@testable import MVP

class EditProfileViewControllerTypeMock: EditProfileViewControllerType {
    var didCallSetup = false
    var receivedProfile: Profile?
    var didCallShowNicknameError = false
    var didCallShowFavoriteThingError = false
    var didCallShowSubmissionError = false
    var receivedError: ProfileValidationError?
    var didCallFinishEditingProfile = false

    
    func setup(with profile: Profile) {
        didCallSetup = true
        receivedProfile = profile
    }
    
    func showNicknameError() {
        didCallShowNicknameError = true
    }
    
    func showFavoriteThingError() {
        didCallShowFavoriteThingError = true
    }
    
    func showSubmissionError(_ error: ProfileValidationError) {
        didCallShowSubmissionError = true
        receivedError = error
    }
    
    func didFinishEditingProfile() {
        didCallFinishEditingProfile = true
    }
}
