import UIKit

class TriangleView : UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .clear
    }
        
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.backgroundColor = .clear
    }
        
    override func draw(_ rect: CGRect) {
        guard let path = UIGraphicsGetCurrentContext() else {
            return
        }

        path.beginPath()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: rect.width, y: 0))
        path.addLine(to: CGPoint(x: 0, y: rect.height))
        path.closePath()
        
        path.setFillColor(Color.backColor.cgColor)
        path.fillPath()
    }
}
