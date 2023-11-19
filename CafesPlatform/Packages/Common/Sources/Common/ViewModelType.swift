// The Swift Programming Language
// https://docs.swift.org/swift-book

public protocol ViewModelType {
    associatedtype Input
    associatedtype Output
    
    func transform(input: Input) -> Output
}
