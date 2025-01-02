import UIKit

class SettingsViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupSelectors()
    }
    
    let titleScreen = createLabel(text: "Настройки", color: .white, fontSize: 17)
    
    let closeButton: UIButton = {
        let button = UIButton()
        button.setTitle("Закрыть", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        button.backgroundColor = .clear
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // Текстовые лейблы
    let heightText = createLabel(text: "Высота", color: .white, fontSize: 17)
    let diametrText = createLabel(text: "Диаметр", color: .white, fontSize: 17)
    let weightText = createLabel(text: "Масса", color: .white, fontSize: 17)
    let payloadText = createLabel(text: "Полезная нагрузка", color: .white, fontSize: 17)
    
    // Переключатели
    let heightSystem = Switch(firstText: "m", secondText: "ft", keyForStatement: "isOn1")
    let dimetrSystem = Switch(firstText: "m", secondText: "ft", keyForStatement: "isOn2")
    let weightSystem = Switch(firstText: "kg", secondText: "lb", keyForStatement: "isOn3")
    let payloadSystem = Switch(firstText: "kg", secondText: "lb", keyForStatement: "isOn4")
    
    // Создаем StackView
    let stackViewText: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .leading       // Центрирование элементов по горизонтали
        stackView.distribution = .equalSpacing // Равномерное распределение между элементами
        stackView.spacing = 45              // Отступы между элементами
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let stackViewSwitcher: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .trailing       // Центрирование элементов по горизонтали
        stackView.distribution = .equalSpacing // Равномерное распределение между элементами
        stackView.spacing = 15              // Отступы между элементами
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    func setupUI() {
        view.backgroundColor = .black
        let views = [titleScreen, closeButton, stackViewText, stackViewSwitcher]
        views.forEach { view.addSubview($0) }
        
        let viewsToStackViewText = [heightText, diametrText, weightText, payloadText]
        viewsToStackViewText.forEach { stackViewText.addArrangedSubview($0) }
        
        let viewsToStackViewSwitcher = [heightSystem, dimetrSystem, weightSystem, payloadSystem]
        viewsToStackViewSwitcher.forEach { stackViewSwitcher.addArrangedSubview($0) }

        NSLayoutConstraint.activate([
            // Заголовок
            titleScreen.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            titleScreen.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            closeButton.centerYAnchor.constraint(equalTo: titleScreen.centerYAnchor),
            closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            
            stackViewText.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            stackViewText.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            
            stackViewSwitcher.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            stackViewSwitcher.centerYAnchor.constraint(equalTo: stackViewText.centerYAnchor)
        ])
    }
    
    func setupSelectors() {
        closeButton.addTarget(self, action: #selector(toButtonClose), for: .touchUpInside)
        closeButton.addTarget(self, action: #selector(changeButtonAlpha(_:)), for: [.touchDown, .touchUpInside, .touchUpOutside])
    }
    
    @objc func toButtonClose() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func changeButtonAlpha(_ sender: UIButton) {
        UIView.animate(withDuration: 0.2) {
            sender.alpha = sender.isHighlighted ? 0.6 : 1.0
        }
    }
    
    // MARK: - Helper Functions
    static func createLabel(text: String, color: UIColor, fontSize: CGFloat) -> UILabel {
        let label = UILabel()
        label.text = text
        label.textColor = color
        label.font = UIFont.systemFont(ofSize: fontSize)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
}


