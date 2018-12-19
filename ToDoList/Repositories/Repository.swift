import Foundation

protocol Repository {
    associatedtype T
    
    func getAll() -> [T]
    func get(identifier: String) -> T?
    func update(a: T) -> Bool
    func remove(a: T) -> Bool
    func create(a: T) -> Bool
}
