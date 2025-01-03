import UIKit

class Test: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        x()
        view.backgroundColor = .red
        setupUI()
    }
    
    let label: UILabel = {
        let label = UILabel()
        label.text = "Loading..."
        label.font = .boldSystemFont(ofSize: 30)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0  // Позволяет тексту занимать несколько строк
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    private func setupUI() {
        view.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
    func x () {
        // Инициализация класса и запуск
        let apiStarts = ApiStarts()
        apiStarts.startFetching()
        
        // Задержка для асинхронного выполнения (только для консольных приложений)
        RunLoop.main.run()
    }
}

