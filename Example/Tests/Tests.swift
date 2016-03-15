import UIKit
import XCTest
import JKBCrypt

class Tests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testRandomForLength() {
        // Given
        let length = 20
        // Then
        XCTAssertEqual(length, JKBCryptRandom.generateRandomDataOfLength(length).length)
        XCTAssertEqual(length, JKBCryptRandom.generateRandomStringOfLength(length).characters.count)
        XCTAssertEqual(length, JKBCryptRandom.generateRandomSignedDataOfLength(length).length)
    }
    
    func testHashPassword() {
        // Given
        let salt = JKBCrypt.generateSalt()
        let password = "test1234567890"
        
        // When
        let hash = JKBCrypt.hashPassword(password, withSalt: salt)
        // Then
        XCTAssertNotNil(hash)
        let verified = JKBCrypt.verifyPassword(password, matchesHash: hash!)
        XCTAssertNotNil(verified)
        XCTAssert(verified!)
    }
    
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock() {
            // Put the code you want to measure the time of here.
        }
    }
    
}
