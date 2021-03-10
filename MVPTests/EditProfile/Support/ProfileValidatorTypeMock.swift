@testable import MVP

class ProfileValidatorTypeMock: ProfileValidatorType {
    var error: ProfileValidationError?
    
    func validate(profile: Profile) -> ProfileValidationError? {
        return error
    }
}
