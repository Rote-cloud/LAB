import Foundation
import UIKit
import Kingfisher

struct HeroModel {
    let name: String
    let image: UIImageView
    let color: UIColor
    
    static func getHeroModel(name: String, imageURL: String) -> HeroModel {
        let url = URL(string: imageURL)
        let imageView = UIImageView()
        imageView.kf.setImage(with: url)
        
        return HeroModel(name: name, image: imageView, color: HeroModel.getColor(imageView: imageView))
    }
    
    static func getColor(imageView: UIImageView) -> UIColor {
        return imageView.image?.areaAverage() ?? .red
    }
}

var heroArray: [HeroModel] = {
    let hero1 = HeroModel.getHeroModel(name: "Deadpool", imageURL: "https://iili.io/JMnAfIV.png")
    let hero2 = HeroModel.getHeroModel(name: "IronMan", imageURL: "https://iili.io/JMnuDI2.png")
    let hero3 = HeroModel.getHeroModel(name: "SpiderMan", imageURL: "https://iili.io/JMnuyB9.png")

    return [hero1, hero2, hero3]
}()
