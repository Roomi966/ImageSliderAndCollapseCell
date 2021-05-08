//
//  ViewController.swift
//  ImageSliderAndCollapseCell
//
//  Created by EHSAN YAQOOB on 29/04/2021.
//  Copyright © 2021 EHSAN YAQOOB. All rights reserved.
//

import UIKit
import ImageSlideshow
import Alamofire

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    
    @IBOutlet weak var imgSlideShow: ImageSlideshow!
    
    @IBOutlet weak var imgViews: UIImageView!
    

    @IBOutlet weak var tbView: UITableView!
    
    
    var myArray : [employee] = [employee()]
    
       var imag = ["img1","img2","img3"]

     var sections = ["A", "B" , "C"]
     
       var userDetail = ["Roomi", "Tehreem", "Takwa"]
        
    
       var selectedIndex = 0
       var iscollapse = false
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        imgSlideShow.setImageInputs([
                  ImageSource(image: UIImage(named: "img1")!),
                  ImageSource(image: UIImage(named: "img2")!),
                  AlamofireSource(urlString: "https://images.unsplash.com/photo-1432679963831-2dab49187847?w=1080")!
                  
              ])
              
              imgSlideShow.circular = true
              imgSlideShow.slideshowInterval = 3
              imgSlideShow.zoomEnabled = true
              imgSlideShow.draggingEnabled = true
              tbView.dataSource = self
              tbView.delegate = self
              
        
        
        tbView.delegate = self
        tbView.dataSource = self
        
        tbView.estimatedRowHeight = 270
        tbView.rowHeight = UITableView.automaticDimension
        
        
        myArray.removeAll()
        var temp = employee(Name: "roomi", ID: 23, IMG: imag[0])
        myArray.append(temp)
        temp.Name = "tehreem"
        temp.ID = 25
        temp.IMG = "imag[1]"
        myArray.append(temp)
        
        temp.Name = "takwa"
        temp.ID = 24
        temp.IMG = "imag[2]"
        myArray.append(temp)
              
              
    }


 func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     return myArray.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
     let cell = tableView.dequeueReusableCell(withIdentifier: "collapseCell") as! collapseCell
    cell.lblUserDetalis.text = userDetail[indexPath.row]
    cell.lblName.text = myArray[indexPath.row].Name
     cell.lblID.text = String(myArray[indexPath.row].ID ?? 0)
     cell.imgProfile.image = UIImage(named: imag[indexPath.row])
    
     cell.imgProfile.layer.cornerRadius = 60
     cell.imgProfile.layer.cornerRadius = cell.imgProfile.frame.height/2
     cell.imgProfile.layer.borderWidth = 1
    
     return cell
  }
  
 
 func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
     
     
     if self.selectedIndex == indexPath.row && iscollapse == true {
         return 270
     }

     else
     {
         return 90
     }
     
 }
 
 func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
     
     if selectedIndex == indexPath.row {
         
         if self.iscollapse == false {
         
            self.iscollapse = true
         }
            
         else{
             self.iscollapse = false
         }
         
     } else
         {
             self.iscollapse = true
         }
         
     self.selectedIndex = indexPath.row
     
     tableView.reloadRows(at: [indexPath], with: .automatic)
     
     }
     
 
func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    
    
    
    var headerTitle : String?
         if section == 0
         {
             headerTitle = "Section1"
         }
         if section == 1
         {
             headerTitle = "Section2"
         }
         if section == 2
           {
               headerTitle = "Section3"
           }
         return headerTitle
       

       
   }
   
   func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
       return   50
   }
     
 func numberOfSections(in tableView: UITableView) -> Int{
     
     return myArray.count
     }
 }






