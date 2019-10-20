
public extension String {
    
    func setUrlParameter(_ param: String, _ value: String) -> String {
        return self.replacingOccurrences(of: "{\(param)}", with: value)
    }
    
    static func fromAny(object: Any) -> String {
        return object as! String
    }
    
}
