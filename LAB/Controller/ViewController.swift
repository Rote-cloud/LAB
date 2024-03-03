import UIKit
import SnapKit

class ViewController: UIViewController {
    
    private var marvelLogoImageView = UIImageView()
    private let marvelLogoImage = UIImage(named: "marvelLogo")
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = "Choose your hero"
        label.font = UIFont.boldSystemFont(ofSize: 35)
        label.textColor = .white
        return label
    }()
    
    private var heroArray: [HeroModel] = {
        let hero1 = HeroModel(name: "Deadpool", imageName: "deadpool")
        let hero2 = HeroModel(name: "Deadpool", imageName: "deadpool")
        
        return [hero1, hero2]
    }()
    
    private let collectionView: UICollectionView = {
        let layout = PagingCollectionViewLayout()
        layout.scrollDirection = .horizontal
        layout.numberOfItemsPerPage = 1
        layout.minimumLineSpacing = 30
        layout.sectionInset = UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 30)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.decelerationRate = .fast
        collectionView.backgroundColor = UIColor(red: 40/255, green: 40/255, blue: 40/255, alpha: 1)
        collectionView.register(HeroView.self, forCellWithReuseIdentifier: HeroView.identifier)
        
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
    }
    
    private func setupUI() {
        view.backgroundColor = UIColor(red: 40/255, green: 40/255, blue: 40/255, alpha: 1)
                
        marvelLogoImageView = UIImageView(image: marvelLogoImage)
        view.addSubview(marvelLogoImageView)
        marvelLogoImageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(60)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(140)
            $0.height.equalTo(25)
        }
        
        view.addSubview(label)
        label.snp.makeConstraints {
            $0.top.equalTo(marvelLogoImageView).inset(60)
            $0.centerX.equalToSuperview()
        }
                
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints {
            $0.top.equalTo(label).inset(100)
            $0.centerX.width.equalToSuperview()
            $0.height.equalTo(550)
        }
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.heroArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HeroView.identifier, for: indexPath) as? HeroView else {
            fatalError("Fail")
        }
        
        let hero = self.heroArray[indexPath.row]
        let image = hero.imageName
        let text = hero.name
        cell.config(image: UIImage(named: image)!, str: text)
        
        return cell
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 320, height: 550)
    }
}
