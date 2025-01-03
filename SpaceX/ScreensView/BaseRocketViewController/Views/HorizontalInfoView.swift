import UIKit

class HorizontalInfoView: UIView {
    let nameOfRocket: String

    let horizontalScrollView: UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.showsHorizontalScrollIndicator = false
        return view
    }()
    
    var squareInfoView1 = UIView()
    var squareInfoView2 = UIView()
    var squareInfoView3 = UIView()
    var squareInfoView4 = UIView()

    // Переключатели для единиц измерения
    let heightSystem = Switch(firstText: "m", secondText: "ft", keyForStatement: "isOn1")
    let diametrSystem = Switch(firstText: "m", secondText: "ft", keyForStatement: "isOn2")
    let weightSystem = Switch(firstText: "kg", secondText: "lb", keyForStatement: "isOn3")
    let payloadSystem = Switch(firstText: "kg", secondText: "lb", keyForStatement: "isOn4")
    
    init(nameOfRocket: String) {
        self.nameOfRocket = nameOfRocket
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        loadData()
        setupHorizontalView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let api = Api()
    var rockets: [WelcomeElement] = []
    
    private func loadData() {
        api.getData { [weak self] (rockets: [WelcomeElement]) in
            guard let self = self else { return }

            if rockets.isEmpty { return }

            self.rockets = rockets

            if let theRocket = rockets.first(where: { $0.name == self.nameOfRocket }) {
                self.updateUIForRocket(theRocket)
            }
        }
    }

    private func updateUIForRocket(_ rocket: WelcomeElement) {
        let isHeightInFeet = heightSystem.isSwitchOn
        let isDiametrInFeet = diametrSystem.isSwitchOn
        let isWeightInPounds = weightSystem.isSwitchOn
        let isPayloadInPounds = payloadSystem.isSwitchOn

        // Высота
        let heightUnit = isHeightInFeet ? "ft" : "mt"
        let height = isHeightInFeet ? rocket.height.feet : rocket.height.meters
        DispatchQueue.main.async {
            HorizontalInfoView.initTheSquare(nameView: &self.squareInfoView1, title: "\(height!)", subtitle: "Высота (\(heightUnit))")
            self.horizontalStackView.addArrangedSubview(self.squareInfoView1)
        }

        // Диаметр
        let diameterUnit = isHeightInFeet ? "ft" : "mt"
        let diameter = isDiametrInFeet ? rocket.diameter.feet : rocket.diameter.meters
        DispatchQueue.main.async {
            HorizontalInfoView.initTheSquare(nameView: &self.squareInfoView2, title: "\(diameter!)", subtitle: "Диаметр (\(diameterUnit))")
            self.horizontalStackView.addArrangedSubview(self.squareInfoView2)
        }

        // Масса
        let weightUnit = isWeightInPounds ? "lb" : "kg"
        let mass = isWeightInPounds ? rocket.mass.lb : rocket.mass.kg
        DispatchQueue.main.async {
            HorizontalInfoView.initTheSquare(nameView: &self.squareInfoView3, title: "\(mass)", subtitle: "Масса (\(weightUnit))")
            self.horizontalStackView.addArrangedSubview(self.squareInfoView3)
        }

        // Полезная нагрузка
        let payloadUnit = isPayloadInPounds ? "lb" : "kg"
        let payload = isPayloadInPounds ? rocket.payloadWeights.first?.lb : rocket.payloadWeights.first?.kg
        DispatchQueue.main.async {
            HorizontalInfoView.initTheSquare(nameView: &self.squareInfoView4, title: "\(payload!)", subtitle: "Нагрузка (\(payloadUnit))")
            self.horizontalStackView.addArrangedSubview(self.squareInfoView4)
        }
    }

    static func initTheSquare(nameView: inout UIView, title: String, subtitle: String) {
        nameView = SquareInfoView(titleText: title, subtitleText: subtitle)
    }
    
    let horizontalStackView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .horizontal
        view.spacing = 10
        view.distribution = .fillEqually
        return view
    }()

    func setupHorizontalView() {
        self.addSubview(horizontalScrollView)
        horizontalScrollView.addSubview(horizontalStackView)

        NSLayoutConstraint.activate([
            horizontalScrollView.topAnchor.constraint(equalTo: self.topAnchor),
            horizontalScrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            horizontalScrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            horizontalScrollView.heightAnchor.constraint(equalToConstant: 100),

            horizontalStackView.topAnchor.constraint(equalTo: horizontalScrollView.topAnchor),
            horizontalStackView.leadingAnchor.constraint(equalTo: horizontalScrollView.leadingAnchor),
            horizontalStackView.trailingAnchor.constraint(equalTo: horizontalScrollView.trailingAnchor),
            horizontalStackView.bottomAnchor.constraint(equalTo: horizontalScrollView.bottomAnchor),
            horizontalStackView.heightAnchor.constraint(equalTo: horizontalScrollView.heightAnchor)
        ])
    }
}

