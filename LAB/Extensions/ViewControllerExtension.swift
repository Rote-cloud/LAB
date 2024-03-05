import UIKit

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.getHeroView().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HeroView.identifier, for: indexPath) as? HeroView else {
            fatalError("Fail")
        }
        
        let hero = self.getHeroView()[indexPath.row]
        let image = hero.imageName
        let text = hero.name
        let color = hero.color
        cell.config(image: UIImage(named: image)!, str: text, color: color)
        
        return cell
    }
}
