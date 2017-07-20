//
//  DetailViewController.swift
//  Field Survey
//
//  Created by Bruce Thomson on 7/18/17.
//  Copyright © 2017 Bruce Thomson. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var fieldImage: UIImageView!
    @IBOutlet weak var bottomLabel: UILabel!
    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var textBox: UITextView!
    
    var field: FieldEvent?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        topLabel.text = field?.title
        textBox.text = field?.description
        
        
        switch field!.classification{
        case .amphibian:
            fieldImage.image = #imageLiteral(resourceName: "amphibian.png")
        case .bird:
            fieldImage.image = #imageLiteral(resourceName: "bird.png")
        case .fish:
            fieldImage.image = #imageLiteral(resourceName: "fish.png")
        case .insect:
            fieldImage.image = #imageLiteral(resourceName: "insect.png")
        case .mammal:
            fieldImage.image = #imageLiteral(resourceName: "mammal.png")
        case .plant:
            fieldImage.image = #imageLiteral(resourceName: "plant.png")
        case .reptile:
            fieldImage.image = #imageLiteral(resourceName: "reptile.png")
        }
        
        
        let formatter = DateFormatter()
        formatter.dateStyle = DateFormatter.Style.long
        formatter.timeStyle = .short
        
        let dateString = formatter.string(from: (field!.date))
        
        bottomLabel.text = dateString

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
