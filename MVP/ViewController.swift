import UIKit
import SnapKit

class ViewController: UIViewController {
    private let loginView = LoginView()
    
    override func loadView() {
        view = loginView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
    }
}

class LoginView: UIView {
    private let userTextField = LabeledTextField()
    private let passwordTextField = LabeledTextField()
    private let submitButton = UIButton()
    
    init() {
        super.init(frame: .zero)
        setupView()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension LoginView: ViewCode {
    func addViews() {
        addSubview(userTextField)
        addSubview(passwordTextField)
        addSubview(submitButton)
    }
    
    func addConstraints() {
        userTextField.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.width.equalToSuperview().multipliedBy(0.6)
            $0.height.equalToSuperview().multipliedBy(0.06)
            $0.top.equalTo(snp.centerY).multipliedBy(0.85)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.width.equalToSuperview().multipliedBy(0.6)
            $0.height.equalToSuperview().multipliedBy(0.06)
            $0.top.equalTo(userTextField.snp.bottom).offset(15)
        }
        
        submitButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.width.equalToSuperview().multipliedBy(0.4)
            $0.height.equalToSuperview().multipliedBy(0.07)
            $0.top.equalTo(passwordTextField.snp.bottom).offset(15)
        }
    }
    
    func additionalSetup() {
        submitButton.backgroundColor = .yellow
        submitButton.setTitle("Submit", for: .normal)
        submitButton.setTitleColor(.black, for: .normal)
        
        userTextField.titleLabel.text = "Login"
        userTextField.titleLabel.textColor = .black
        
        passwordTextField.titleLabel.text = "Password"
        passwordTextField.titleLabel.textColor = .black
        
        
    }
}

class LabeledTextField: UIView {
    let titleLabel = UILabel()
    let textField = UITextField()
    
    init() {
        super.init(frame: .zero)
        setupView()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension LabeledTextField: ViewCode {
    func addViews() {
        addSubview(titleLabel)
        addSubview(textField)
    }
    
    func addConstraints() {
        titleLabel.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.top.equalToSuperview()
            $0.height.equalToSuperview().multipliedBy(0.3)
        }
        
        textField.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.top.equalTo(titleLabel.snp.bottom)
            $0.bottom.equalToSuperview()
        }
    }
    
    func additionalSetup() {
        titleLabel.backgroundColor = .red
        textField.backgroundColor = .blue
    }
}
