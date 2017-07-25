import XCTest

class ServiceTests: XCTestCase {
    
    var obj: KeychainSwift!
    
    override func setUp() {
        super.setUp()
        
        obj = KeychainSwift()
        obj.clear()
        obj.lastQueryParameters = nil
        obj.service = nil
    }
    
    // MARK: - Add Service
    
    func testAddService() {
        let items: [String: Any] = [
            "one": "two"
        ]
        
        obj.service = "123.my.test.group"
        let result = obj.addServiceWhenPresent(items)
        
        XCTAssertEqual(2, result.count)
        XCTAssertEqual("two", result["one"] as! String)
        XCTAssertEqual("123.my.test.group", result["svce"] as! String)
    }
    
    func testAddService_nil() {
        let items: [String: Any] = [
            "one": "two"
        ]
        
        let result = obj.addAccessGroupWhenPresent(items)
        
        XCTAssertEqual(1, result.count)
        XCTAssertEqual("two", result["one"] as! String)
    }
}
