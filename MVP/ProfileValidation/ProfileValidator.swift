protocol ProfileValidatorType {
    func validate(nickname: String) -> ProfileValidationError?
    func validate(favoriteThing: String) -> ProfileValidationError?
}
