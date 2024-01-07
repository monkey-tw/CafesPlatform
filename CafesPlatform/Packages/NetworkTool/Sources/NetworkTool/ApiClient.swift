// The Swift Programming Language
// https://docs.swift.org/swift-book

import RxSwift
import Foundation

public enum HttpError: Error {
    case serverError
    case invalidDataError(Error?)
}

public protocol ApiClient {
    func request<T: Decodable>(_ endpoint: ApiEndpoint) -> Observable<T>
}

public class StandardApiClient: ApiClient {
    private let baseUrl: String
    public init(baseUrl: String) {
        self.baseUrl = baseUrl
    }
    
    public func request<T: Decodable>(_ endpoint: ApiEndpoint) -> Observable<T> {
        return .create { observer in
            do {
                //实际项目就通过baseUrl、endPoint进行bff接口请求，该example直接通过本地json返回数据
                if let path = Bundle.module.path(forResource: "join", ofType: "json") {
                    let data = try Data(contentsOf: URL(fileURLWithPath: path))
                    let wrapper = try JSONDecoder().decode(ResponseWrapper<T>.self, from: data)
//                    observer.onNext(wrapper.data)
//                    observer.onCompleted()
                    observer.onError(HttpError.invalidDataError(nil))
                } else {
                    observer.onError(HttpError.invalidDataError(nil))
                }
            } catch {
                observer.onError(HttpError.invalidDataError(error))
            }
            return Disposables.create([])
        }.delay(.seconds(2), scheduler: MainScheduler.asyncInstance)
    }
}
