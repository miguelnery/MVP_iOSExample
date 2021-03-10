import UIKit


class EditProfileView: UIView {
    private let nicknameTextField = LabeledTextField(fieldTag: FieldIdentifier.nickName.rawValue)
    private let favoriteThingTextField = LabeledTextField(fieldTag: FieldIdentifier.favoriteThing.rawValue)
    private let submitButton = UIButton()
    private unowned let delegate: EditProfileViewDelegate
    
    init(delegate: EditProfileViewDelegate) {
        self.delegate = delegate
        super.init(frame: .zero)
        setupView()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(with profile: Profile) {
        nicknameTextField.textField.text = profile.nickname
        favoriteThingTextField.textField.text = profile.favoriteThing
    }
    
    @objc func didTapSubmitButton() {
        delegate.didTapSubmitButton()
    }
    
    enum FieldIdentifier: Int {
        case nickName = 0
        case favoriteThing = 1
    }
}

extension EditProfileView: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let fieldId = FieldIdentifier(rawValue: textField.tag) else {
            print("Could not identify textField")
            return true
        }
        // maybe add some rules here before delegate call
        delegate.didEditTextfield(identifiedBy: fieldId, text: textField.text!)
        return true
    }
}

extension EditProfileView: ViewCode {
    func addViews() {
        addSubview(nicknameTextField)
        addSubview(favoriteThingTextField)
        addSubview(submitButton)
    }
    
    func addConstraints() {
        nicknameTextField.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.width.equalToSuperview().multipliedBy(0.6)
            $0.height.equalToSuperview().multipliedBy(0.06)
            $0.top.equalTo(snp.centerY).multipliedBy(0.85)
        }
        
        favoriteThingTextField.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.width.equalToSuperview().multipliedBy(0.6)
            $0.height.equalToSuperview().multipliedBy(0.06)
            $0.top.equalTo(nicknameTextField.snp.bottom).offset(15)
        }
        
        submitButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.width.equalToSuperview().multipliedBy(0.4)
            $0.height.equalToSuperview().multipliedBy(0.07)
            $0.top.equalTo(favoriteThingTextField.snp.bottom).offset(15)
        }
    }
    
    func additionalSetup() {
        submitButton.backgroundColor = .yellow
        submitButton.setTitle("Submit", for: .normal)
        submitButton.setTitleColor(.black, for: .normal)
        submitButton.addTarget(self, action: #selector(didTapSubmitButton), for: .touchUpInside)
        
        nicknameTextField.titleLabel.text = "Nickname"
        nicknameTextField.titleLabel.textColor = .black
        nicknameTextField.textField.delegate = self
        
        favoriteThingTextField.titleLabel.text = "Favorite thing"
        favoriteThingTextField.titleLabel.textColor = .black
        favoriteThingTextField.textField.delegate = self
    }
}

protocol EditProfileViewDelegate: class {
    func didTapSubmitButton()
    func didEditTextfield(identifiedBy fieldId: EditProfileView.FieldIdentifier, text: String)
}

