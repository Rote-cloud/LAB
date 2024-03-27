import UIKit

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.getHeroModelArray().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HeroView.identifier, for: indexPath) as? HeroView else {
            assert(false, "Fail")
        }
        
        let hero = self.getHeroModelArray()[indexPath.row]
        let image = hero.imageName
        let text = hero.name
        let color = hero.color
        if let img = UIImage(named: image) {
            cell.config(image: img, str: text, color: color)
        }
        return cell
    }
}
