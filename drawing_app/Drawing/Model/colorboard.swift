//
//  colorboard.swift
//  Drawing
//
//  Created by LabUser on 10/1/18.
//

import UIKit
import Foundation

class colorboard{
    
//    var color:UIColor
//
//
//    init(pencolor:UIColor ){
//
//        self.color = pencolor
//
//    }
    
    var color: colorType
    var pencolor: UIColor
    
    enum colorType {
        case red
        case orange
        case yellow
        case blue
        case green
        case purple
        case magenta
    }
    
    init(color:colorType){
        self.color = color
        
        switch self.color{
        case .red:
            self.pencolor = UIColor.init(red: 1, green: 0, blue: 0, alpha: 0.68)
        case .orange:
            self.pencolor = UIColor.init(red: 1, green: 0.6471, blue: 0, alpha: 0.68)
        case .yellow:
            self.pencolor = UIColor.init(red: 1, green: 1, blue: 0, alpha: 0.68)
        case .green:
            self.pencolor = UIColor.init(red: 0, green: 1, blue: 0, alpha: 0.68)
        case .blue:
            self.pencolor = UIColor.init(red: 0, green: 0, blue: 1, alpha: 0.68)
        case .purple:
            self.pencolor = UIColor.init(red: 0.6275, green: 0.1254, blue: 0.9412, alpha: 0.68)
        default:
            self.pencolor = UIColor.init(red: 1, green: 0, blue: 1, alpha: 0.68)
            

        }
    }
}
