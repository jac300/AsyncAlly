import Foundation

public struct AsyncAlly {}

typealias AATask<ValueType> = (_ success: @escaping (ValueType) -> Void,
    _ failure: @escaping (Error?) -> Void) -> URLSessionDataTask

//typealias AATaskVoid<ValueType> = (_ success: @escaping (ValueType) -> Void,
//    _ failure: @escaping (Error?) -> Void) -> Void

public struct AATaskObject<ValueType> {

    private(set) var task: AATask<ValueType>
    //private(set) var taskVoid: AATaskVoid<ValueType>?

    init(_ task: @escaping AATask<ValueType>) {
        self.task = task
    }

//    init(_ taskVoid: @escaping AATaskVoid<ValueType>) {
//        self.taskVoid = taskVoid
//    }
}
