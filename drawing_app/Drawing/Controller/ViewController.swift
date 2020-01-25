//
//  ViewController.swift
//  Drawing
//
//  Created by LabUser on 9/30/18.
//

import UIKit

class ViewController: UIViewController {
    
//    let red = colorboard(color: .red)
//    let orange = colorboard(color: .orange)
//    let yellow = colorboard(color: .yellow)
//    let green = colorboard(color: .green)
//    let blue = colorboard(color: .blue)
//    let purple = colorboard(color: .purple)
//    let magenta = colorboard(color: .magenta)
    
    //@IBOutlet weak var drawView: UIView!
    @IBOutlet weak var drawView: LineView!
    
    var currentLine:Line?
    var lineCanvas:LineView!
    var brigeColor:UIColor!
    var photo:UIImage!
    
    @IBOutlet weak var slider: UISlider!
    
    
    @IBAction func sizeSlider(_ sender: Any) {

           currentLine?.thickness = CGFloat(slider.value)
    }


    @IBAction func red(_ sender: Any) {
      
        //lineCanvas.pigment = red
        //currentLine?.color = UIColor.init(red: 1, green: 0, blue: 0, alpha: 0.68)
        brigeColor = UIColor.init(red: 1, green: 0, blue: 0, alpha: 0.68)
         slider.tintColor = brigeColor
    }
    
    
    @IBAction func orange(_ sender: Any) {
       
        //lineCanvas.pigment = orange
        //lineCanvas.pigment = orange
         brigeColor = UIColor.init(red: 1, green: 0.6471, blue: 0, alpha: 0.68)
         slider.tintColor = brigeColor
    }
    
    
    @IBAction func yellow(_ sender: Any) {
       
        //lineCanvas.pigment = yellow
        brigeColor = UIColor.init(red: 1, green: 1, blue: 0, alpha: 0.68)
         slider.tintColor = brigeColor
    }
    
    
    @IBAction func green(_ sender: Any) {
        
        //lineCanvas.pigment = green
        //currentLine?.color = UIColor.init(red: 0, green: 1, blue: 0, alpha: 0.68)
        brigeColor = UIColor.init(red: 0, green: 1, blue: 0, alpha: 0.68)
         slider.tintColor = brigeColor
    }
    
    
    @IBAction func blue(_ sender: Any) {
       
        //lineCanvas.pigment = blue
        //currentLine?.color = UIColor.init(red: 0, green: 0, blue: 1, alpha: 0.68)
        brigeColor = UIColor.init(red: 0, green: 0, blue: 1, alpha: 0.68)
         slider.tintColor = brigeColor
    }
    
    
    @IBAction func purple(_ sender: Any) {
       
        //lineCanvas.pigment = purple
        //currentLine?.color = UIColor.init(red: 0.6275, green: 0.1254, blue: 0.9412, alpha: 0.68)
        brigeColor = UIColor.init(red: 0.6275, green: 0.1254, blue: 0.9412, alpha: 0.68)
         slider.tintColor = brigeColor
    }
    
    
    @IBAction func magenta(_ sender: Any) {
        
       //lineCanvas.pigment = magenta
        //currentLine?.color = UIColor.init(red: 1, green: 0, blue: 1, alpha: 0.68)
        brigeColor = UIColor.init(red: 1, green: 0, blue: 1, alpha: 0.68)
        slider.tintColor = brigeColor
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //lineCanvas = LineView(frame: drawView.frame)
        //view.addSubview(lineCanvas)
        slider.maximumValue = 20
        slider.minimumValue = 2.0
        slider.value = 11.0
        brigeColor = UIColor.red
        view.backgroundColor = UIColor.init(red: 0.9020, green: 0.9804, blue: 1, alpha: 0.5)
         slider.tintColor = UIColor.init(red: 1, green: 0, blue: 0, alpha: 0.68)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touchPoint = (touches.first)!.location(in: view) as CGPoint
        print("touching at\(touchPoint)")
        currentLine = Line()
        currentLine?.color = brigeColor
        currentLine?.thickness = CGFloat(slider.value)
        

    }
    
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
         let touchPoint = (touches.first)!.location(in: view) as CGPoint
         print("moving at \(touchPoint)")
        


        
        currentLine?.addPoint(touchPoint)
        drawView.theLine = currentLine
        
        
        
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touchPoint = (touches.first)!.location(in: view) as CGPoint
        print("Ending at\(touchPoint)")
        

        currentLine?.addPoint(touchPoint)
        drawView.theLine = currentLine
        
        if let newLine = currentLine {
            drawView.lines.append(newLine)
        }
    }
    
    
    
    @IBAction func clearButton(_ sender: Any) {
        
        drawView.lines.removeAll()
        drawView.theLine = nil
        
    }
    
    
    @IBAction func undoButton(_ sender: Any) {
          drawView.theLine = nil
          if(drawView.lines.first != nil){
            drawView.lines.removeLast()
        }
        
    }
    
    
    @IBAction func saveToAlbum(_ sender: Any) {
        photo = UIImage(view:drawView)
        UIImageWriteToSavedPhotosAlbum(photo, nil, nil, nil)
    }
    
}


extension UIImage{
    convenience init(view: UIView){
        UIGraphicsBeginImageContextWithOptions(view.bounds.size, true, 0)
        view.drawHierarchy(in: view.bounds, afterScreenUpdates: true)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        //self.init(cgImage: (image?.cgImage!)!)
        self.init(cgImage: (image?.cgImage)!)
    }
    
    
    
    
}

