import Foundation
import UIKit
import Kingfisher

struct HeroModel {
    let name: String
    let imageURL: String
    let text: String
    let color: UIColor
    
    func getUIImageView() -> UIImageView {
        let url = URL(string: imageURL)
        let imageView = UIImageView()
        imageView.kf.indicatorType = .activity
        imageView.kf.indicator?.view.tintColor = .white
        imageView.kf.setImage(with: url) { result in
                    switch result {
                    case .success(_):
                        print("\(HeroModel.getColor(image: imageView.image))")
                    case .failure(let error):
                        print("Error while loading image: \(error)")
                    }
                }
        
        return imageView
    }
    
    static func getColor(image: UIImage?) -> UIColor {
        return image?.areaAverage() ?? .red
    }
}



var heroArray: [HeroModel] = {
    let hero1 = HeroModel(name: "Deadpool", imageURL: "https://iili.io/JMnAfIV.png", text: "Pleace dont make the super suit green...or animated!", color: Color.darkRed)
    let hero2 = HeroModel(name: "IronMan", imageURL: "https://iili.io/JMnuDI2.png", text: "I AM IRON MAN", color: Color.red)
    let hero3 = HeroModel(name: "SpiderMan", imageURL: "https://iili.io/JMnuyB9.png", text: "I AM SPIDER MAN", color: Color.blue)

    return [hero1, hero2, hero3]
}()
