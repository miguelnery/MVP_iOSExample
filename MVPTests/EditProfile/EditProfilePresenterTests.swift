import XCTest
@testable import MVP

class EditProfilePresenterTests: XCTestCase {
    let validProfile = Profile(nickname: "Goku",
                               favoriteThing: "Shrek")
    let validatorMock = ProfileValidatorTypeMock()
    let submitStuffMock = EditProfileSubmitStuffTypeMock()
    let viewControllerMock = EditProfileViewControllerTypeMock()
    lazy var sut = EditProfilePresenter(profile: validProfile,
                                        profileValidator: validatorMock,
                                        submitStuff: submitStuffMock,
                                        viewController: viewControllerMock)
    
    let nickname = (valid: "babau", invalid: "bubu")
    let favoriteThing = (valid: "shrek", invalid: "farquaad")
    
    func test_submit_onSuccess_ShouldFinishEditing() {
        submitStuffMock.error = nil
        sut.submit()
        XCTAssert(viewControllerMock.didCallFinishEditingProfile)
    }
    
    func test_submit_onFailure_ShouldShowError() {
        submitStuffMock.error = .something
        sut.submit()
        XCTAssert(viewControllerMock.didCallShowSubmissionError)
        XCTAssert(viewControllerMock.receivedError == ProfileValidationError.something)
    }
    
    func test_evaluateNickname_shouldUpdateModel() {
        sut.evaluate(nickname: nickname.valid)
        // calling submit so sut will call submitStuffMock, thus emitting the profile
        sut.submit()
        guard let receivedProfile = submitStuffMock.receivedProfile else {
            fatalError("did not receive any profile on finishEditing(profile:, onSuccess:,onFailure:")
        }
        XCTAssert(receivedProfile.nickname == nickname.valid)
    }
    
    func test_evaluateNickname_onSuccess_shouldReturn() {
        sut.evaluate(nickname: nickname.valid)
        XCTAssertFalse(viewControllerMock.didCallShowNicknameError)
    }
    
    func test_evaluateNickname_onFailure_shouldShowError() {
        validatorMock.error = .something
        sut.evaluate(nickname: nickname.invalid)
        XCTAssert(viewControllerMock.didCallShowNicknameError)
    }
    
    func test_evaluateFavoriteThing_shouldUpdateModel() {
        sut.evaluate(favoriteThing: favoriteThing.valid)
        // calling submit so sut will call submitStuffMock, thus emitting the profile
        sut.submit()
        guard let receivedProfile = submitStuffMock.receivedProfile else {
            fatalError("did not receive any profile on finishEditing(profile:, onSuccess:,onFailure:")
        }
        XCTAssert(receivedProfile.favoriteThing == favoriteThing.valid)
    }
    func test_evaluateFavoriteThing_onSuccess_shouldReturn() {
        sut.evaluate(nickname: favoriteThing.valid)
        XCTAssertFalse(viewControllerMock.didCallShowNicknameError)
    }
    func test_evaluateFavoriteThing_onFailure_shouldShowError() {
        validatorMock.error = .otherThing
        sut.evaluate(favoriteThing: favoriteThing.invalid)
        XCTAssert(viewControllerMock.didCallShowFavoriteThingError)
    }
    
    func test_attatch_ShouldSetupViewController() {
        sut.attach(to: viewControllerMock)
        XCTAssert(viewControllerMock.didCallSetup)
        XCTAssert(viewControllerMock.receivedProfile == validProfile)
    }
}
