//
//  NetworkSupport.swift
//  CGA
//
//  Created by Abdul Kareem on 12/14/21.
//
//
import Foundation
@_implementationOnly import Alamofire

public struct API {
    
    public static let accelav4 = "https://apis.accela.com/v4/settings/"
    public static let accelaV3 = "https://apis.accela.com/v3/"
    public static let loginAccelaPROD = "https://apis.accela.com/oauth2/token"
    public static let getUserInfo = ""
    public static let refreshToken = "RefreshToken"
    
    public static var productionBaseURL = "https://Production.com/"
    public static var supportBaseURL = "https://Support.com/"
    public static var enterpriseBaseURL = "https://Enterprise.com/"
    public static var devBaseURL = "https://developer.com/"
    
    public static var productionBundleIdentifier = ""
    public static var supportBundleIdentifier = ""
    public static var enterpriseBundleIdentifier = ""
    public static var devBaseBundleIdentifier = ""
    
    
   public static func baseURL() -> String {
        switch Bundle.main.bundleIdentifier{
            
        case productionBundleIdentifier:
            return productionBaseURL
        case supportBundleIdentifier:
            return supportBaseURL
        case enterpriseBundleIdentifier:
            return enterpriseBaseURL
        default:
            return devBaseURL
        }
        
    }

    
//    static func completeURLString(Key : API) -> (String, URL?) {
//        switch Key {
//        
//        default:
//            return (API.accelav4.rawValue + Key.rawValue, URL(string: API.accelav4.rawValue + Key.rawValue))
//        }
//    }
}

public enum HTTPRequestType: String {

    case GET = "GET"
    case POST = "POST"
    case PATCH = "PATCH"
    case DELETE = "DELETE"
    case PUT = "PUT"
    
    func type() -> HTTPMethod{
        switch self {
        case .GET:
            return .get
        case .POST:
            return .post
        
        case .PATCH:
            return .patch
        case .DELETE:
            return .delete
        case .PUT:
            return .put
        }
    }
}

public enum StatusCode: Int {
    
    case notReachable = 504
    case success = 200
    case multipleResponse = 300
    case unAuthorized = 401
    case notFound = 404
    case serverError = 500
    case unprocessableEntry = 422
    case unknown = 0
    case generic = 4000
    case serverErrorCode = 5000
    case timout = 4001
    case login = 4003
    case internet = 4004
}

public enum CGAError: String, Error {
    
    case invalidURL = "Invalid URL"
    case invalidResponse = "Invalid response"
    case invalidParameters = "invalid parameters"
    case internetFailure = "The Internet connection appears to be offline."
    case unAuthorized = "Unauthorized access"
    case multipleResponse = "Multiple Response"
    case notFound = "Not Found"
    case notReachable = "Not Reachable"
    case success = "Success"
    case unknown = "Unknown"
    case unProcessableEntry = "UnProcessable Entry"
    case accessTokenMissing = "Access Token Missing"
    case genericError = "Please Try Again."
    case serverNotAvailable = "Server Not Available"
    case serverError = "Server Not Availabe, Please Try Later."
    case timoutError = "Network Time Out, Please Quit and Try Again Later."
    
     static func getError(statusCode: Int) -> CGAError {
        
        switch statusCode {
        case StatusCode.multipleResponse.rawValue:
            return .multipleResponse
        case StatusCode.unAuthorized.rawValue:
            return .unAuthorized
        case StatusCode.notFound.rawValue:
            return .notFound
        case StatusCode.serverError.rawValue:
            return .serverError
        case StatusCode.unprocessableEntry.rawValue:
            return .unProcessableEntry
        case StatusCode.generic.rawValue:
            return .genericError
        case StatusCode.timout.rawValue:
            return .timoutError
        
        default:
            return .unknown
        }
    }
}

public struct WebConstants {

    public static let shared = WebConstants()
    
    public let Post = "POST"
    public let SecretKey = "secretKey"
    public let XRequestedWith = "X-Requested-With"
    public let XMLHttpRequest = "XMLHttpRequest"
    public let ContentType = "Content-Type"
    public let ApplicationJson = "application/json"
    public let MultipartFormData = "multipart/form-data"
    public let Authorization = "Authorization"
    public let AccessToken = "access_token"
    public let CFBundleShortVersionString = "CFBundleShortVersionString"
    public let Password = "password"
    public let Bearer = "Bearer "
    
}

public enum CGAEncoding {
    case url
    case JSON
    
    func type() -> ParameterEncoding {
        
        switch self {
        case .url:
            return URLEncoding.default
        case .JSON:
            return JSONEncoding.default
        }
    }
}
