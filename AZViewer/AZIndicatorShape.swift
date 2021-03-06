//
//  AZIndicatorShape.swift
//  Pods
//
//  Created by Ali Zahedi on 12/27/1395 AP.
//
//

import Foundation

enum AZIndicatorShape{
    
    case circle
    case ring
    case ringTwoHalfVertical
    case ringTwoHalfHorizontal
    
    
    func layerWith(size: CGSize, color: UIColor) -> CALayer {
        let layer: CAShapeLayer = CAShapeLayer()
        let path: UIBezierPath = UIBezierPath()
        let lineWidth: CGFloat = 2
        
        switch self {
        case .circle:
            path.addArc(withCenter: CGPoint(x: size.width / 2, y: size.height / 2),
                        radius: size.width / 2,
                        startAngle: 0,
                        endAngle: CGFloat(2 * M_PI),
                        clockwise: false)
            layer.fillColor = color.cgColor
        case .ring:
            path.addArc(withCenter: CGPoint(x: size.width / 2, y: size.height / 2),
                        radius: size.width / 2,
                        startAngle: 0,
                        endAngle: CGFloat(2 * M_PI),
                        clockwise: false)
            layer.fillColor = nil
            layer.strokeColor = color.cgColor
            layer.lineWidth = lineWidth
        case .ringTwoHalfVertical:
            path.addArc(withCenter: CGPoint(x: size.width / 2, y: size.height / 2),
                        radius: size.width / 2,
                        startAngle: CGFloat(-3 * M_PI_4),
                        endAngle: CGFloat(-M_PI_4),
                        clockwise: true)
            path.move(
                to: CGPoint(x: size.width / 2 - size.width / 2 * CGFloat(cos(M_PI_4)),
                            y: size.height / 2 + size.height / 2 * CGFloat(sin(M_PI_4)))
            )
            path.addArc(withCenter: CGPoint(x: size.width / 2, y: size.height / 2),
                        radius: size.width / 2,
                        startAngle: CGFloat(-5 * M_PI_4),
                        endAngle: CGFloat(-7 * M_PI_4),
                        clockwise: false)
            layer.fillColor = nil
            layer.strokeColor = color.cgColor
            layer.lineWidth = lineWidth
        case .ringTwoHalfHorizontal:
            path.addArc(withCenter: CGPoint(x: size.width / 2, y: size.height / 2),
                        radius: size.width / 2,
                        startAngle: CGFloat(3 * M_PI_4),
                        endAngle: CGFloat(5 * M_PI_4),
                        clockwise: true)
            path.move(
                to: CGPoint(x: size.width / 2 + size.width / 2 * CGFloat(cos(M_PI_4)),
                            y: size.height / 2 - size.height / 2 * CGFloat(sin(M_PI_4)))
            )
            path.addArc(withCenter: CGPoint(x: size.width / 2, y: size.height / 2),
                        radius: size.width / 2,
                        startAngle: CGFloat(-M_PI_4),
                        endAngle: CGFloat(M_PI_4),
                        clockwise: true)
            layer.fillColor = nil
            layer.strokeColor = color.cgColor
            layer.lineWidth = lineWidth
        }
        
        layer.backgroundColor = nil
        layer.path = path.cgPath
        layer.frame = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        
        return layer
    }
}
