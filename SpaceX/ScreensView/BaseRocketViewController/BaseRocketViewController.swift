
import UIKit

class BaseRocketViewController: UIViewController {
    //MARK: - UI

    let scrollView: UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .black
        view.layer.cornerRadius = 50
        return view
    }()
    
    let nameOfImage: String
        
    lazy var img: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: nameOfImage)
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFill
        img.clipsToBounds = true
        return img
    }()
    
    let nameOfRocket: String
    
    lazy var titleOfPage: UILabel = {
        let title = UILabel()
        title.text = nameOfRocket
        title.textColor = .white
        title.font = UIFont.boldSystemFont(ofSize: 24)
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()

    let settingButton: UIButton = {
        let button = UIButton(type: .system)
        let image = UIImage(systemName: "gearshape")
        let imageView = UIImageView(image: image)
        imageView.tintColor = .systemGray
        imageView.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        button.addSubview(imageView)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
     
     let rocketLaunchButton = RocketLaunchButton()
    
    init (nameOfRocket: String, nameOfImage: String) {
        self.nameOfRocket = nameOfRocket
        self.nameOfImage = nameOfImage
        
        super.init(nibName: nil, bundle: nil)
        
        viewDidLoad()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
     //MARK: - viewDidLoad
     override func viewDidLoad() {
         super.viewDidLoad()
         self.view.backgroundColor = .black
                  
         setupImageView()
         setupView()
         setupFirstContent()
         setupHorizontalView()
         setupSecondContent()
         addTargets()
     }

    //MARK: - addTargets
    
    private func addTargets() {
        settingButton.addTarget(self, action: #selector(targetForSettingButton),
                                for: .touchUpInside)
        settingButton.addTarget(self, action: #selector(buttonTouchDownBright),
                                for: .touchDown)
        settingButton.addTarget(self, action: #selector(buttonTouchUpInsideBright),
                                for: .touchUpInside)
        settingButton.addTarget(self, action: #selector(buttonTouchUpOutsideBright),
                                for: .touchUpOutside)
        
        rocketLaunchButton.addTarget(self, action: #selector(rocketViewTapped), for: .touchUpInside)
        rocketLaunchButton.addTarget(self, action: #selector(buttonTouchDownTransform),
                                for: .touchDown)
        rocketLaunchButton.addTarget(self, action: #selector(buttonTouchUpTransform),
                                for: .touchUpInside)
        rocketLaunchButton.addTarget(self, action: #selector(buttonTouchUpTransform),
                                for: .touchUpOutside)
    }
    
    //MARK: - setupViews
    
    func setupImageView() {
        view.addSubview(img)
        
        NSLayoutConstraint.activate([
            img.topAnchor.constraint(equalTo: view.topAnchor),
            img.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            img.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            img.heightAnchor.constraint(equalToConstant: 300)
        ])
    }
    
    func setupView() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        //scrollView
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        //contentView
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 160),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: view.widthAnchor),
            contentView.heightAnchor.constraint(equalToConstant: 840)
        ])
    }
    
    //MARK: - setupFirstContent
    
    func setupFirstContent() {
        let views = [titleOfPage, settingButton]
        views.forEach {contentView.addSubview($0)}
        
        NSLayoutConstraint.activate([
            titleOfPage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 40),
            titleOfPage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 60),
            
            settingButton.centerYAnchor.constraint(equalTo: titleOfPage.centerYAnchor),
            settingButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -40),
            settingButton.heightAnchor.constraint(equalToConstant: 40),
            settingButton.widthAnchor.constraint(equalToConstant: 40),
        ])
    }
    
    //MARK: - setupHorizontal
    
    lazy var horizontal = HorizontalInfoView(nameOfRocket: nameOfRocket)
    
    private func setupHorizontalView() {
        contentView.addSubview(horizontal)
        
        NSLayoutConstraint.activate([
            horizontal.topAnchor.constraint(equalTo: titleOfPage.bottomAnchor, constant: 40),
            horizontal.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            horizontal.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            horizontal.heightAnchor.constraint(equalToConstant: 100),
        ])
        
    }
    
    lazy var allInfoView = BlockOfInfoView(nameOfRocket: nameOfRocket)
    
    //MARK: - setupSecondContent

    func setupSecondContent() {
        [allInfoView, rocketLaunchButton]
            .forEach {contentView.addSubview($0)}
         
        NSLayoutConstraint.activate([
            allInfoView.topAnchor.constraint(equalTo: horizontal.bottomAnchor),
            allInfoView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            allInfoView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            rocketLaunchButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            rocketLaunchButton.topAnchor.constraint(equalTo: allInfoView.bottomAnchor, constant: 20)
        ])
    }
    
//MARK: - selectors
    
    @objc func targetForSettingButton() {
        let buttonVC = SettingsViewController()
        buttonVC.modalPresentationStyle = .pageSheet
        present(buttonVC, animated: true, completion: nil)
    }
    
    @objc func rocketViewTapped() {
        let rocketVC = RocketViewController(rocket: nameOfRocket)
        navigationController?.pushViewController(rocketVC, animated: true)
    }
    
    
//MARK: - animations
    
    @objc func buttonTouchDownBright() {
        UIView.animate(withDuration: 0.0, animations: {
            self.settingButton.alpha = 0.6
        })
    }

    @objc func buttonTouchUpInsideBright() {
        UIView.animate(withDuration: 0.0, animations: {
            self.settingButton.alpha = 1.0
        })
    }

    @objc func buttonTouchUpOutsideBright() {
        UIView.animate(withDuration: 0.0, animations: {
            self.settingButton.alpha = 1.0
        })
    }
    
    @objc func buttonTouchDownTransform(_ sender: UIButton) {
        UIView.animate(withDuration: 0.1) {
            sender.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
        }
    }

    @objc func buttonTouchUpTransform(_ sender: UIButton) {
        UIView.animate(withDuration: 0.1) {
            sender.transform = CGAffineTransform.identity
        }
    }
}
