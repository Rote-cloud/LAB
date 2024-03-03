import UIKit
import SnapKit

class HeroView : UICollectionViewCell {
    
    static let identifier = "HeroView"
    
    private let imageView : UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "chooseImage")
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 20
        image.clipsToBounds = true
        return image
    }()
    
    private let textView : UILabel = {
        let text = UILabel()
        text.text = "String"
        text.textColor = .white
        text.font = UIFont.boldSystemFont(ofSize: 35)
        text.textAlignment = .center
        
        return text
    }()
    
    public func config(image: UIImage, str: String) {
        self.imageView.image = image
        self.textView.text = str
        self.setupUI()
    }
    
    private func setupUI() {
        contentView.addSubview(imageView)
        imageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
                
        contentView.addSubview(textView)
        textView.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(40)
            $0.right.equalTo(imageView).inset(90)
            $0.left.bottom.equalToSuperview()
        }
    }
}
