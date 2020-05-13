import Foundation

open class Ambiente {
    static var BASE_URL = AmbientesApi.PROD.rawValue
}

public enum AmbientesApi : String {
    case TESTES = "http://localhost:8080/"
    case PROD = "https://itunes.apple.com/"
}
