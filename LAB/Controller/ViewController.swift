import UIKit
import CollectionViewPagingLayout
import SnapKit

class ViewController: UIViewController {
    
    var triangle = UIView()
    
    private var marvelLogoImageView = UIImageView()
    private let marvelLogoImage = UIImage(named: "marvelLogo")
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = "Choose your hero"
        label.font = Fonts.logoFont
        label.textColor = .white
        return label
    }()
    
    private var heroArray: [HeroModel] = {
        let hero1 = HeroModel(name: "Deadpool", imageName: "Deadpool", color: Color.darkRed)
        let hero2 = HeroModel(name: "Iron Man", imageName: "IronMan", color: Color.red)
        let hero3 = HeroModel(name: "Spider Man", imageName: "SpiderMan", color: Color.blue)

        return [hero1, hero2, hero3]
    }()
    
    private let collectionView: UICollectionView = {
        let layout = CollectionViewPagingLayout()
        layout.scrollDirection = .horizontal
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.decelerationRate = .fast
        collectionView.backgroundColor = .clear
        collectionView.isPagingEnabled = true
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
        view.backgroundColor = Color.backColor
        
    
        marvelLogoImageView = UIImageView(image: marvelLogoImage)
        view.addSubview(marvelLogoImageView)
        marvelLogoImageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(Sizes.paddingTop)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(Sizes.marvelLogoWidth)
            $0.height.equalTo(Sizes.marvelLogoHeight)
        }
        
        view.addSubview(label)
        label.snp.makeConstraints {
            $0.top.equalTo(marvelLogoImageView).inset(Sizes.paddingTop)
            $0.centerX.equalToSuperview()
        }
        
        triangle = TriangleView(frame: CGRect(x: 0, y: Sizes.height / 2, width: Sizes.width, height: Sizes.height / 2))
        view.addSubview(triangle)
        
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints {
            $0.top.equalTo(label).inset(Sizes.paddingTopCollectionView)
            $0.centerX.width.equalToSuperview()
            $0.height.equalTo(Sizes.heightCollectionView)
        }
    }
    
    public func getHeroView() -> [HeroModel] {
        return heroArray
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let visibleRect = CGRect(origin: collectionView.contentOffset, size: collectionView.bounds.size)
        let visiblePoint = CGPoint(x: visibleRect.midX, y: visibleRect.midY)
        if let visibleIndexPath = collectionView.indexPathForItem(at: visiblePoint) {
            if let visibleCell = collectionView.cellForItem(at: visibleIndexPath) as? HeroView {
                triangle.backgroundColor = visibleCell.getColor()
            }
        }
    }

}
