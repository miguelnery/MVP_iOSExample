import UIKit

class LabeledTextField: UIView {
    let titleLabel = UILabel()
    let textField = UITextField()
    var fieldTag: Int { textField.tag }
    
    init(fieldTag: Int) {
        super.init(frame: .zero)
        setupView()
        textField.tag = tag
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
