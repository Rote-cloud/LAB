import UIKit
import SnapKit

class HeroViewController: UIViewController {
    
    var itemModel: HeroModel
    
    init(itemModel: HeroModel) {
        self.itemModel = itemModel
        nameView.text = self.itemModel.name
        textView.text = self.itemModel.text
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let nameView : UILabel = {
        let text = UILabel()
        text.text = "String"
        text.textColor = .white
        text.font = Fonts.logoFont
        text.textAlignment = .center
        
        return text
    }()
    
    private let textView: UILabel = {
        let text = UILabel()
        text.text = "String"
        text.textColor = .white
        text.font = Fonts.textFont
        text.textAlignment = .left
        text.numberOfLines = 0
        text.lineBreakMode = .byWordWrapping
        
        return text
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
                
        self.setupUI()
    }
    
    private func setupUI() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "arrow.left"), style: .plain, target: self, action: #selector(goBack))
        navigationItem.leftBarButtonItem?.tintColor = .white
        
        let imageView = itemModel.getUIImageView()
        imageView.clipsToBounds = true

        
        view.addSubview(imageView)
            
        imageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        
        view.addSubview(textView)
        
        textView.snp.makeConstraints {
            $0.left.bottom.equalToSuperview().inset(Sizes.paddingLogoCell)
            $0.right.equalToSuperview().inset(Sizes.paddingText)
        }
        
        view.addSubview(nameView)
        
        nameView.snp.makeConstraints {
            $0.left.equalToSuperview().inset(Sizes.paddingLogoCell)
            $0.bottom.equalTo(textView.snp.top).offset(-Sizes.paddingText)
        }

    }
    
    @objc func goBack() {
        navigationController?.popViewController(animated: true)
    }
}
