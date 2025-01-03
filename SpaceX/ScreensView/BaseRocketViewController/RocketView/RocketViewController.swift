import UIKit

class RocketViewController: UIViewController {
    
    let rocket: String
    
    init(rocket: String) {
        self.rocket = rocket
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        
        navigationItem.title = rocket
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        navigationController?.navigationBar.tintColor = .white

        setupUI()
    }
    
    let falconSat = RocketInfoSquareView(title: "FalconSat",
                                         subtitle: "2 февраля, 2022",
                                         success: true)
    let heavyHolidays = RocketInfoSquareView(title: "Heavy Holidays",
                                             subtitle: "6 января, 2022",
                                             success: true)
    let crs24 = RocketInfoSquareView(title: "CRS-24 Mission",
                                     subtitle: "23 декабря, 2021",
                                     success: false)
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 30
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private func setupUI() {
        view.addSubview(stackView)
        [falconSat, heavyHolidays, crs24].forEach{ stackView.addArrangedSubview($0) }
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}
