//
//  FieldTableViewController.swift
//  Field Survey
//
//  Created by Bruce Thomson on 7/18/17.
//  Copyright © 2017 Bruce Thomson. All rights reserved.
//

import UIKit
import Foundation

class FieldTableViewController: UITableViewController  {
    @IBOutlet var fieldTableView: UITableView!
    
    var fieldEvents: [FieldEvent]?
    let fieldEventsJSONFile = "field_observations"

    override func viewDidLoad() {
        super.viewDidLoad()

        fieldEvents = FieldEventsJSONLoader.load(fileName: fieldEventsJSONFile)
        self.title = "Field Events"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "fieldCell", for: indexPath) as! FieldTableViewCell
        
        var index = 0
        //        while index < (sportingEvents?.count)! {
        let myField = fieldEvents?[indexPath.row]
        
        cell.topLabel.text = myField?.title
        let fieldIcon = FieldEvent.init(classification: (myField?.classification)!, title: (myField?.title)!, description: (myField?.description)!, date: (myField?.date)!)
        switch fieldIcon.classification{
        case .amphibian:
            cell.fieldImage.image = #imageLiteral(resourceName: "amphibian.png")
        case .bird:
            cell.fieldImage.image = #imageLiteral(resourceName: "bird.png")
        case .fish:
            cell.fieldImage.image = #imageLiteral(resourceName: "fish.png")
        case .insect:
            cell.fieldImage.image = #imageLiteral(resourceName: "insect.png")
        case .mammal:
            cell.fieldImage.image = #imageLiteral(resourceName: "mammal.png")
        case .plant:
            cell.fieldImage.image = #imageLiteral(resourceName: "plant.png")
        case .reptile:
            cell.fieldImage.image = #imageLiteral(resourceName: "reptile.png")
        }
        
        
        
        
        let formatter = DateFormatter()
        formatter.dateStyle = DateFormatter.Style.long
        formatter.timeStyle = .short
        
        let dateString = formatter.string(from: (myField?.date)!)
        
        cell.bottomLabel.text = dateString
        index += 1
        
        return cell
    }
    

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let row = tableView.indexPathForSelectedRow?.row {
            let field = fieldEvents?[row]
            print("Selected cell \(field)")
        }
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailViewController,
            let row = fieldTableView.indexPathForSelectedRow?.row {
            destination.field = (fieldEvents?[row])!
        }
        
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
