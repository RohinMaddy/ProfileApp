//
//  ViewController.swift
//  Userdetails_iOS
//
//  Created by Rohin Madhavan on 08/02/2023.
//

import UIKit

class SplashViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    private var viewModel : ViewModel!
    var data: Profile?
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        callToViewModelForUIUpdate()
    }
// function call to the viewmodel to get the API data and bind it to the controller.
    func callToViewModelForUIUpdate(){
        self.viewModel =  ViewModel()
        self.viewModel.bindViewModelToController = {
            self.data = self.viewModel.userData
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

}

// Controller extension to populate and manage tableview delegate and datasource

extension SplashViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let data = data {
            return data.groups[section].credentials.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier") as! TableViewCell
        if let data = data {
            cell.logoImage.setImageFromUrl(ImageURL: data.groups[indexPath.section].credentials[indexPath.row].logo)
            cell.nameLabel.text = data.groups[indexPath.section].credentials[indexPath.row].name
        }
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if let data = data {
            return data.groups.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if let data = data {
            return data.groups[section].name
        }
        return nil
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "DetailsViewController") as? DetailsViewController
        vc?.credentials = data?.groups[indexPath.section].credentials[indexPath.row]
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int){
        view.tintColor = UIColor.systemBlue
        view.alpha = 0.8
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.textColor = UIColor.white
    }
}
// image extension to load image from url asynchronously

extension UIImageView {
    func setImageFromUrl(ImageURL :String) {
       URLSession.shared.dataTask( with: NSURL(string:ImageURL)! as URL, completionHandler: {
          (data, response, error) -> Void in
          DispatchQueue.main.async {
             if let data = data {
                self.image = UIImage(data: data)
             }
          }
       }).resume()
    }
}

