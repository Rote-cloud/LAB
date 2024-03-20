import UIKit

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return heroArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HeroView.identifier, for: indexPath) as? HeroView else {
            assert(false, "Fail")
        }
        
        let hero = heroArray[indexPath.item]
        let image = hero.getUIImageView()
        let text = hero.name
        //let color = HeroModel.getColor(image: image.image)
        let color = hero.color
        
        cell.config(image: image, str: text, color: color)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        let heroViewController = HeroViewController(itemModel: heroArray[indexPath.item])
        
        self.navigationController?.pushViewController(heroViewController, animated: true)
    }
}

