import Foundation

public struct AsyncAlly {}

typealias AATask<ValueType> = (_ success: @escaping (ValueType) -> Void,
    _ failure: @escaping (Error?) -> Void) -> URLSessionDataTask

public struct AATaskObject<ValueType> {

    private(set) var task: AATask<ValueType>

    init(_ task: @escaping AATask<ValueType>) {
        self.task = task
    }
}
