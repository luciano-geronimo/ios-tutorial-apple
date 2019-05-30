import XCTest
@testable import TutorialAppleFoodTracker

class TutorialAppleFoodTrackerTests: XCTestCase {
    func testMealInitializationSucceeds(){
        //testa caso de rating = 0
        let zeroRatingMeal = Meal.init(name: "zero", photo: nil, rating: 0)
        XCTAssertNotNil(zeroRatingMeal)
        //testa a maior nota possivel
        let positiveRetingMeal = Meal.init(name: "max", photo: nil, rating: 5)
        XCTAssertNotNil(positiveRetingMeal)
    }
    
    func testMealInitializationFails(){
        let negativeRating = Meal.init(name: "neg", photo: nil, rating: -1)
        XCTAssertNil(negativeRating)
        let noName = Meal.init(name: "", photo: nil, rating: 0)
        XCTAssertNil(noName)
        let beyondMax = Meal.init(name:"toobig", photo:  nil, rating: 6)
        XCTAssertNil(beyondMax)
    }

}
