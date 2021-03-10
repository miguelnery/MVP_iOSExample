protocol EditProfileSubmitStuffType {
    func finishEditing(profile: Profile,
                       onSuccess success: @escaping () -> Void,
                       onFailure failure: @escaping (ProfileValidationError) -> Void)
}

class EditProfileSubmitStuff: EditProfileSubmitStuffType {
    func finishEditing(profile: Profile,
                       onSuccess success: @escaping () -> Void,
                       onFailure failure: @escaping (ProfileValidationError) -> Void) {
        success()
    }
}
