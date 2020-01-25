//
//  CircleView.swift
//  Drawing
//
//  Created by LabUser on 9/30/18.
//

import UIKit
import Foundation
class LineView: UIView {
    
    //var pigment = colorboard(color: .red )
    
    var thePoints: [CGPoint] = []
    
    var theLine:Line?{
        didSet{
            setNeedsDisplay()
        }
    }
    
    var lines:[Line] = []{
        didSet{
            setNeedsDisplay()
        }
    }
    

    
    override init(frame:CGRect){
        super.init(frame: frame)
        self.backgroundColor = UIColor.init(red: 0.5020, green: 0.5020, blue: 0.5020, alpha: 0.1)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
//functions
    private func midpoint(first: CGPoint, second: CGPoint) -> CGPoint {
        // implement this function here
        return CGPoint(x: ((first.x + second.x)/2), y:((first.y + second.y)/2) )
    }
    
    func createQuadPath(points: [CGPoint]) -> UIBezierPath {
        let path = UIBezierPath()
        if points.count < 2 { return path }
        let firstPoint = points[0]
        let secondPoint = points[1]
        let firstMidpoint = midpoint(first: firstPoint, second: secondPoint)
        path.move(to: firstPoint)
        path.addLine(to: firstMidpoint)
        for index in 1 ..< points.count-1 {
            let currentPoint = points[index]
            let nextPoint = points[index + 1]
            let midPoint = midpoint(first: currentPoint, second: nextPoint)
            path.addQuadCurve(to: midPoint, controlPoint: currentPoint)
        }
        guard let lastLocation = points.last else { return path }
        path.addLine(to: lastLocation)
        return path
    }

    
    func drawCircle(_ line: Line ){
        let path = UIBezierPath()
        //pigment.pencolor.setFill()
        line.color.setFill()
        path.addArc(withCenter: line.line.first!, radius: line.thickness/2, startAngle: 0, endAngle: CGFloat.pi*2, clockwise: true)
        path.fill()
        
    }
    
    func drawLine(_ line: Line){
        var newPath = UIBezierPath()
        newPath = createQuadPath(points: line.line)
        newPath.lineWidth = line.thickness
        newPath.lineCapStyle = .round
        //pigment.pencolor.setStroke()
        line.color.setStroke()
        newPath.stroke()
        
    }
    
    

    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
//        UIColor.green.setFill()
//
//        let circleRadius = bounds.height/2
//
//        let path = UIBezierPath()
//
//        path.addArc(withCenter: CGPoint(x:circleRadius, y:circleRadius), radius: circleRadius, startAngle: 0, endAngle: CGFloat.pi*2, clockwise: true)
//        path.fill()
        for line in lines {
            if(line.line.count > 2){
                drawLine(line)
            }
            else{
                drawCircle(line)
            }
        }
        if(theLine != nil){
           drawLine(theLine!)
        }
        
    }
    

}
