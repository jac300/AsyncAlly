import Foundation

public struct AsyncAlly {}

public struct AATaskObject<ValueType> {
    typealias AATask<ValueType> = (_ success: @escaping (ValueType) -> Void,
                                      _ failure: @escaping (Error?) -> Void) -> URLSessionDataTask

    private(set) var task: AATask<ValueType>

    init(_ task: @escaping AATask<ValueType>) {
        self.task = task
    }
}
