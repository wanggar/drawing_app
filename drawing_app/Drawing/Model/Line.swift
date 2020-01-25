//
//  File.swift
//  Drawing
//
//  Created by LabUser on 9/30/18.
//

import UIKit
import Foundation


struct Line{
    var line: [CGPoint]
    var thickness: CGFloat
    var color: UIColor
    
    
    init() {
        line = []
        thickness = 5
        color = UIColor.init(red: 1, green: 0, blue: 0, alpha: 0.68)
    }
    
    mutating func addPoint(_ newPoint: CGPoint){
        line.append(newPoint)
    }
    
    
    
}
