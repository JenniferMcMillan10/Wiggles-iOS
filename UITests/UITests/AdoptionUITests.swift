//
//  AdoptionUITests.swift
//  UITests
//
//  Created by Jennifer McMillan on 27/11/2023.
//

class AdoptionUITests: UITestCase {
    lazy var adoptionList = { AdoptionListScreen(app: app) }()
    lazy var dogDetails = { DogDetailsScreen(app: app) }()
    
    func test_user_on_personal_home_screen_views_dog_details_and_goes_back() {
        adoptionList
            .assertOnMainScreen(name: "Sameer")
            .assertDogSummaryIsShown(name: "Parkinson", contentDescription: "Parkinson, 2 yrs | Playful, 341m away, Male, 12 min ago")
            .tapOnDog(name: "Parkinson")
        
        dogDetails
            .assertOnDetailsScreen(name: "Parkinson")
            .tapBackButton()
        
        adoptionList.assertOnMainScreen(name: "Sameer")
    }
    
    func test_user_navigates_to_dog_details_and_favourites() {
        navigateToDogDetailsScreen()
        
        dogDetails.tapFaveButton()
    }
    
    func test_user_navigates_to_dog_details_and_messages() {
        navigateToDogDetailsScreen()
        
        dogDetails.tapMessageButton()
        // TODO: assert something happens
    }
    
    func test_user_navigates_to_dog_details_and_adopts() {
        navigateToDogDetailsScreen()
        
        dogDetails.tapAdoptMeButton()
        // TODO: assert something happens
    }
    
    func navigateToDogDetailsScreen() {
        adoptionList
            .tapOnDog(name: "Parkinson")
        
        dogDetails
            .assertOnDetailsScreen(name: "Parkinson")
    }
}
