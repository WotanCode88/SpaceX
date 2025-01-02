//import UIKit
//
//class HorizontalInfoView: UIView {
//    let nameOfRocket: String
//    
//    let horizontalScrollView: UIScrollView = {
//        let view = UIScrollView()
//        view.translatesAutoresizingMaskIntoConstraints = false
//        view.showsHorizontalScrollIndicator = false
//        return view
//    }()
//        
//    var squareInfoView1 = UIView()
//    var squareInfoView2 = UIView()
//    var squareInfoView3 = UIView()
//    var squareInfoView4 = UIView()
//    
//    init (nameOfRocket: String) {
//        self.nameOfRocket = nameOfRocket
//        
//        super.init(frame: .zero)
//        
//        self.translatesAutoresizingMaskIntoConstraints = false
//        
//        loadData()
//        setupHorizontalView()
//
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    let api = Api()
//    var rockets: [WelcomeElement] = []
//
//    private func loadData() {
//       api.getData { [weak self] (rockets: [WelcomeElement]) in
//           guard let self = self else { return }
//           
//           if rockets.isEmpty { return }
//           
//           self.rockets = rockets
//           
//           if let theRocket = rockets.first(where: { $0.name == self.nameOfRocket }) {
//               
//               // Инициализация представлений с разными данными
//               if let height = theRocket.height.meters {
//                   DispatchQueue.main.async {
//                       HorizontalInfoView.initTheSquare(nameView: &self.squareInfoView1, title: "\(height)", subtitle: "Высота (mt)")
//                       self.horizontalStackView.addArrangedSubview(self.squareInfoView1)
//                   }
//               }
//               
//               if let diameter = theRocket.diameter.meters {
//                   DispatchQueue.main.async {
//                       HorizontalInfoView.initTheSquare(nameView: &self.squareInfoView2, title: "\(diameter)", subtitle: "Диаметр (mt)")
//                       self.horizontalStackView.addArrangedSubview(self.squareInfoView2)
//                   }
//               }
//               
//               let mass = theRocket.mass.kg
//               DispatchQueue.main.async {
//                   HorizontalInfoView.initTheSquare(nameView: &self.squareInfoView3, title: "\(mass)", subtitle: "Масса (kg)")
//                   self.horizontalStackView.addArrangedSubview(self.squareInfoView3)
//               }
//               
//               if let payload = theRocket.payloadWeights.first?.kg {
//                   DispatchQueue.main.async {
//                       HorizontalInfoView.initTheSquare(nameView: &self.squareInfoView4, title: "\(payload)", subtitle: "Нагрузка (kg)")
//                       self.horizontalStackView.addArrangedSubview(self.squareInfoView4)
//                   }
//               }
//           }
//       }
//    }
//
//
//    static func initTheSquare(nameView: inout UIView, title: String, subtitle: String) {
//        nameView = SquareInfoView(titleText: title, subtitleText: subtitle)
//    }
//    
//    let horizontalStackView: UIStackView = {
//        let view = UIStackView()
//        view.translatesAutoresizingMaskIntoConstraints = false
//        view.axis = .horizontal
//        view.spacing = 10
//        view.distribution = .fillEqually
//        return view
//    }()
//    
//    func setupHorizontalView() {
//        self.addSubview(horizontalScrollView)
//        horizontalScrollView.addSubview(horizontalStackView)
//        
//        NSLayoutConstraint.activate([
//            horizontalScrollView.topAnchor.constraint(equalTo: self.topAnchor),
//            horizontalScrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
//            horizontalScrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
//            horizontalScrollView.heightAnchor.constraint(equalToConstant: 100),
//            
//            horizontalStackView.topAnchor.constraint(equalTo: horizontalScrollView.topAnchor),
//            horizontalStackView.leadingAnchor.constraint(equalTo: horizontalScrollView.leadingAnchor),
//            horizontalStackView.trailingAnchor.constraint(equalTo: horizontalScrollView.trailingAnchor),
//            horizontalStackView.bottomAnchor.constraint(equalTo: horizontalScrollView.bottomAnchor),
//            horizontalStackView.heightAnchor.constraint(equalTo: horizontalScrollView.heightAnchor)
//        ])
//    }
//}

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
    
    init (nameOfRocket: String) {
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
               
               
                            
               if let height = theRocket.height.meters {
                   DispatchQueue.main.async {
                       HorizontalInfoView.initTheSquare(nameView: &self.squareInfoView1, title: "\(height)", subtitle: "Высота (mt)")
                       self.horizontalStackView.addArrangedSubview(self.squareInfoView1)
                   }
               }
               
               if let diameter = theRocket.diameter.meters {
                   DispatchQueue.main.async {
                       HorizontalInfoView.initTheSquare(nameView: &self.squareInfoView2, title: "\(diameter)", subtitle: "Диаметр (mt)")
                       self.horizontalStackView.addArrangedSubview(self.squareInfoView2)
                   }
               }
               
               let mass = theRocket.mass.kg
               DispatchQueue.main.async {
                   HorizontalInfoView.initTheSquare(nameView: &self.squareInfoView3, title: "\(mass)", subtitle: "Масса (kg)")
                   self.horizontalStackView.addArrangedSubview(self.squareInfoView3)
               }
               
               if let payload = theRocket.payloadWeights.first?.kg {
                   DispatchQueue.main.async {
                       HorizontalInfoView.initTheSquare(nameView: &self.squareInfoView4, title: "\(payload)", subtitle: "Нагрузка (kg)")
                       self.horizontalStackView.addArrangedSubview(self.squareInfoView4)
                   }
               }
           }
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
