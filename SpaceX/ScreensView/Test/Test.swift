import UIKit

class Test: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadData()  // Загружаем данные о ракетах
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
    
    let api1 = Api1()
    var rockets1: [WelcomeElement1] = []

   private func loadData() {
       api1.getData { [weak self] (rockets1: [WelcomeElement1]) in
           guard let self = self else { return }
           
           if rockets1.isEmpty { return }
           self.rockets1 = rockets1
           
           if let falcon9 = rockets1.first(where: { $0.name == "Falcon 9" }) {
               
               let x = falcon9.dateUnix
               self.label.text = String(x)
           }
        }
    }
    //    private func loadData() {
//        api.getData { [weak self] (rockets: [WelcomeElement]) in
//            guard let self = self else { return }
//            
//            if rockets.isEmpty {
//                self.label.text = "No rockets found."
//            } else {
//                // Сохраняем все ракеты
//                self.rockets = rockets
//                
//                // Ищем ракету с именем "Falcon Heavy"
//                if let falconHeavy = rockets.first(where: { $0.name == "Falcon Heavy" }) {
//                    // Извлекаем данные о первой ступени, имени и двигателях
//                    let firstFlight = falconHeavy.firstFlight
//                    let name = falconHeavy.name
//                    let engines = falconHeavy.firstStage.engines
//                    let timeToBorn = falconHeavy.firstStage.burnTimeSEC
//                    let countFuel = falconHeavy.firstStage.fuelAmountTons
//                    
//                    let engines1 = falconHeavy.secondStage.engines
//                    let countFuel1 = falconHeavy.secondStage.fuelAmountTons
//                    let timeToBorn1 = falconHeavy.secondStage.burnTimeSEC
//                    
//                    // Формируем строку с нужной информацией
//                    self.label.text = """
//                        Rocket: \(name)
//                        First Flight: \(firstFlight)
//                        Engines: \(engines)
//                        Fuel: \(countFuel)
//                        Time to born: \(timeToBorn ?? 1)
//                        
//                        Engines: \(engines1)
//                        Fuel: \(countFuel1)
//                        Time to born: \(timeToBorn1 ?? 1)
//                        """
//                } else {
//                    self.label.text = "Falcon Heavy not found."
//                }
//            }
//        }
//    }

}

