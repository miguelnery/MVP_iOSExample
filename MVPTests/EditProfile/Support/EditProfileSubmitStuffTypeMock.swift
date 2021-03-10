@testable import MVP

class EditProfileSubmitStuffTypeMock: EditProfileSubmitStuffType {
    var error: ProfileValidationError?
    var receivedProfile: Profile?
    
    func finishEditing(profile: Profile, onSuccess success: @escaping () -> Void, onFailure failure: @escaping (ProfileValidationError) -> Void) {
        receivedProfile = profile
        guard let error = self.error else { success(); return }
        failure(error)
    }
}
