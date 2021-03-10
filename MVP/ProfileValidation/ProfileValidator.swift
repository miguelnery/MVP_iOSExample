protocol ProfileValidatorType {
    func validate(profile: Profile) -> ProfileValidationError?
}

class ProfileValidator: ProfileValidatorType {
    func validate(profile: Profile) -> ProfileValidationError? { .something }
}
