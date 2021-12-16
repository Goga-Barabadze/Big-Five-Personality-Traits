//
//  Big_Five_Personality_TraitsTests.swift
//  Big Five Personality TraitsTests
//
//  Created by Goga Barabadze on 07.12.21.
//

import XCTest
@testable import Big_Five_Personality_Traits

class Big_Five_Personality_TraitsTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testOpenRessourceFiles() {
        
        let files: [(String, String)] = [
            ("short-inventory", "json"),
            ("full-inventory", "json")
        ]
        
        for file in files {
            
            guard let filePath = Bundle.main.path(forResource: file.0, ofType: file.1) else {
                XCTAssertTrue(false, "Could not load file named '\(file.0).\(file.1)'.")
                return
            }
            
            guard let _ = try? Data(contentsOf: URL(fileURLWithPath: filePath)) else {
                XCTAssertTrue(false, "Could not generate content from file named '\(file.0).\(file.1)'.")
                return
            }
            
        }
    }
    
    func testParseJsonInventories(){
        
        XCTAssertFalse(Model.fullInventory.isEmpty, "Could not parse full inventory.")
        XCTAssertFalse(Model.shortInventory.isEmpty, "Could not parse short inventory.")
        
    }
    
    func testCalculateShortResultNeutral(){
        
        let answers: [Int : AnswerOption] = [
            1: .neutral,
            2: .neutral,
            3: .neutral,
            4: .neutral,
            5: .neutral,
            6: .neutral,
            7: .neutral,
            8: .neutral,
            9: .neutral,
            10: .neutral
        ]
        
        let result = Result(id: UUID(), participant: "Goga", date: Date(), answers: answers, inventory: .short)
        
        XCTAssertEqual(result.openness, 0)
        XCTAssertEqual(result.conscientiousness, 0)
        XCTAssertEqual(result.extraversion, 0)
        XCTAssertEqual(result.agreeableness, 0)
        XCTAssertEqual(result.neuroticism, 0)
    }
    
    func testCalculateShortResult(){
        
        let answers: [Int : AnswerOption] = [
            1: .agreeStrongly,
            2: .agreeALittle,
            3: .disagreeALittle,
            4: .disagreeALot,
            5: .agreeStrongly,
            6: .neutral,
            7: .agreeALittle,
            8: .neutral,
            9: .agreeStrongly,
            10: .neutral
        ]
        
        let result = Result(id: UUID(), participant: "Goga", date: Date(), answers: answers, inventory: .short)
        
        XCTAssertEqual(result.openness, -2)
        XCTAssertEqual(result.conscientiousness, 1)
        XCTAssertEqual(result.extraversion, -2)
        XCTAssertEqual(result.agreeableness, 0)
        XCTAssertEqual(result.neuroticism, 4)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
