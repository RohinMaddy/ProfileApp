//
//  ViewModel.swift
//  Userdetails_iOS
//
//  Created by Rohin Madhavan on 08/02/2023.
//

import UIKit

class ViewModel: NSObject {
    private var apiManager : APIManager!
    private(set) var userData : Profile! {
        didSet {
            self.bindViewModelToController()
        }
    }
    
    var bindViewModelToController : (() -> ()) = {}
    
    override init() {
        super.init()
        self.apiManager =  APIManager()
        getApiData()
    }
// Function call to API service to get the user data and it is bound to the controller.
    func getApiData() {
        self.apiManager.apiToGetProfileData { (userData) in
            self.userData = userData
        }
    }
}
