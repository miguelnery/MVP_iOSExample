import SnapshotTesting
import XCTest
@testable import MVP

class LabeledTextFieldTests: XCTestCase {
    let expectedTag = 0
    lazy var sut = LabeledTextField(fieldTag: expectedTag,
                                    frame: CGRect(x: 0, y: 0, width: 400, height: 150))
    
    func test_labeledTextField_whenInitialized_shouldLookLikeThis() {
        assertSnapshot(matching: sut, as: .image)
    }
}
