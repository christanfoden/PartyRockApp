//
//  MainVC.swift
//  PartyRockApp
//
//  Created by Christan on 08/07/2017.
//  Copyright © 2017 Christan. All rights reserved.
//

import UIKit

class MainVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!

    var partyRocks = [PartyRock]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let p1 = PartyRock (imageURL: "https://yt3.ggpht.com/-Vkm0xXz9RsU/AAAAAAAAAAI/AAAAAAAAAAA/p3YwcMir7S4/s900-c-k-no-mo-rj-c0xffffff/photo.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/fF70ORRYr5o?rel=0&amp;controls=0&amp;showinfo=0\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Best Song Ever")
        
        let p2 = PartyRock (imageURL: "https://yt3.ggpht.com/-Vkm0xXz9RsU/AAAAAAAAAAI/AAAAAAAAAAA/p3YwcMir7S4/s900-c-k-no-mo-rj-c0xffffff/photo.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/fF70ORRYr5o?rel=0&amp;controls=0&amp;showinfo=0\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Killing Spree")
        
        let p3 = PartyRock (imageURL: "https://yt3.ggpht.com/-Vkm0xXz9RsU/AAAAAAAAAAI/AAAAAAAAAAA/p3YwcMir7S4/s900-c-k-no-mo-rj-c0xffffff/photo.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/fF70ORRYr5o?rel=0&amp;controls=0&amp;showinfo=0\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Double Kill")
        
        let p4 = PartyRock (imageURL: "https://yt3.ggpht.com/-Vkm0xXz9RsU/AAAAAAAAAAI/AAAAAAAAAAA/p3YwcMir7S4/s900-c-k-no-mo-rj-c0xffffff/photo.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/fF70ORRYr5o?rel=0&amp;controls=0&amp;showinfo=0\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Take Me To Your Leader")
        
        let p5 = PartyRock (imageURL: "https://yt3.ggpht.com/-Vkm0xXz9RsU/AAAAAAAAAAI/AAAAAAAAAAA/p3YwcMir7S4/s900-c-k-no-mo-rj-c0xffffff/photo.jpg", videoURL: "<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/fF70ORRYr5o?rel=0&amp;controls=0&amp;showinfo=0\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Alright Now, Baby YEA!")
        
        partyRocks.append(p1)
        partyRocks.append(p2)
        partyRocks.append(p3)
        partyRocks.append(p4)
        partyRocks.append(p5)
        
        tableView.delegate = self
        tableView.dataSource = self
    
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "PartyCell", for: indexPath) as? PartyCell {
            
            let partyRock = partyRocks[indexPath.row]
            
            cell.updateUI(partyRock: partyRock)
            
            return cell
            
        } else {
            return UITableViewCell()
            
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
          return partyRocks.count
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let partyRock = partyRocks[indexPath.row]
        
        performSegue(withIdentifier: "VideoVC", sender: partyRock)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let destination = segue.destination as? VideoVC {
            
            if let party = sender as? PartyRock {
                destination.partyRock = party
            }
            
        }
        
    }
    
        
}
