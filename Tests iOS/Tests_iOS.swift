//
//  Tests_iOS.swift
//  Tests iOS
//
//  Created by Henry Fan on 2022/5/20.
//

import XCTest
import ComposableArchitecture
@testable import TCA

class TimerLabelTests: XCTestCase {
    
    let scheduler = DispatchQueue.test
    
    func testTimerUpdate() throws {
        let store = TestStore(
            initialState: TimerState(),
            reducer: timerReducer,
            environment: TimerEnvironment(
                date: { Date(timeIntervalSince1970: 100) },
                mainQueue: scheduler.eraseToAnyScheduler()
            )
        )
        
        store.send(.start) {
            $0.started = Date(timeIntervalSince1970: 100)
        }
        
        scheduler.advance(by: .microseconds(35))
        
        store.receive(.timeUpdated) {
            $0.duration = 0.01
        }
        
        store.receive(.timeUpdated) {
            $0.duration = 0.02
        }
        
        store.receive(.timeUpdated) {
            $0.duration = 0.03
        }
        
        store.send(.stop)
    }
}

class Tests_iOS: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
    
//    func testCounterIncrement() throws {
//        let store = TestStore(
//            initialState: Counter(count: Int.random(in: -10...10)),
//            reducer: counterReducer,
//            environment: .test
//        )
//        store.send(.playNext) { state in
//            state = Counter(count: 0, secret: 5)
//        }
//    }
}

//extension CounterEnvironment {
//    static let test = CounterEnvironment(generateRandom: { _ in 5 })
//}
