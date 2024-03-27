import UIKit
import CollectionViewPagingLayout
import SnapKit

class HeroView : UICollectionViewCell {
    
    static let identifier = "HeroView"
    private var color: UIColor = .red
    private var card: UIView!
    
    private let imageView : UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "chooseImage")
        image.frame = CGRect(x: 0, y: 0, width: Sizes.width, height: Sizes.height)
        image.layer.cornerRadius = 20
        image.clipsToBounds = true
        return image
    }()
    
    private let textView : UILabel = {
        let text = UILabel()
        text.text = "String"
        text.textColor = .white
        text.font = Fonts.logoFont
        text.textAlignment = .center
        
        return text
    }()
    
    public func config(image: UIImage, str: String, color: UIColor) {
        self.imageView.image = image
        self.textView.text = str
        self.color = color
        self.setupUI()
    }
    
    private func setupUI() {
        let cardFrame = CGRect(
            x: Sizes.paddingCell,
            y: 0,
            width: Int(Sizes.width) - 2 * Sizes.paddingCell,
            height: Int(Sizes.heightCollectionView)
                )
        card = UIView(frame: cardFrame)

        
        contentView.addSubview(card)

        
        card.addSubview(imageView)
        
        imageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
                
        imageView.addSubview(textView)
        textView.snp.makeConstraints {
            $0.bottom.left.equalToSuperview().inset(Sizes.paddingLogoCell)
        }
    }
    
    public func getColor() -> UIColor {
        return color
    }
}

extension HeroView: ScaleTransformView {
    var scaleOptions: ScaleTransformViewOptions {
        ScaleTransformViewOptions(
            minScale: 0.6,
            scaleRatio: 0.4,
            translationRatio: CGPoint(x: 0.66, y: 0.2),
            maxTranslationRatio: CGPoint(x: 2, y: 0)
            )
    }
}
