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
    
    func getApiData() {
        self.apiManager.apiToGetProfileData { (userData) in
            self.userData = userData
        }
    }
}
