//
//  NetworkManager.swift
//  CGA
//
//  Created by Abdul Kareem on 12/14/21.
//
//
import Foundation

@_implementationOnly import Alamofire



public class NetworkManager {
    
    public static let sharedNetwork = NetworkManager()
    let reachabilityManager = NetworkReachabilityManager()
    
    
    
    public var isReachable: Bool {
        return reachabilityManager?.isReachable ?? false
    }
    
    let session = Session()
    
    public init() {
        
    }
    
    public func requestWithAPI(apiURLString: String, requestObject: JSONSerializable? = nil, httpMethod: HTTPRequestType = .GET, parameters: [String:Any] = [:], headers: [String:String] = [:], encoding: CGAEncoding = .url, body: String = "", completed: @escaping (Result<Data, CGAError>) -> ()) {
        
        // Check Internet connection
        guard isReachable else {
            //#warning("Your app name warning: handle internet connection message")
            completed(.failure(.internetFailure))
            return
        }
        
        guard let url = URL(string: apiURLString) else {
            
            print(error: CGAError.invalidURL, functionName: #function)
            completed(.failure(.invalidURL))
            return
        }
        
        //Setup Headers
        var httpHeaders = HTTPHeaders(headers)
        
        let contentHeader = HTTPHeader(name: WebConstants.shared.ContentType, value: WebConstants.shared.ApplicationJson)
        httpHeaders.add(contentHeader)
        
        print("Request URL \(url.absoluteString)")
        
        session.request(url.absoluteString, method: httpMethod.type(), parameters: parameters, encoding: encoding.type(), headers: httpHeaders).responseJSON { responseData in
            
            switch responseData.result {
                
            case .success(let dictionary):
                
                guard let response = responseData.response else {return}
                
                switch response.statusCode {
                case StatusCode.success.rawValue:
                    do {
                        let data = try JSONSerialization.data(withJSONObject: dictionary, options: .prettyPrinted)
                        completed(.success(data))
                    } catch let error {
                        print(error: error, functionName: #function)
                        
                        completed(.failure(CGAError.getError(statusCode: response.statusCode)))
                    }
                    break
                default:
                    let LoodeckError = CGAError.getError(statusCode: response.statusCode)
                    completed(.failure(LoodeckError))
                    
                    break
                }
                break
            case .failure(let error):
                
                let statusCode = (responseData.response != nil) ? responseData.response!.statusCode : (error.responseCode ?? StatusCode.unknown.rawValue)
                
                let cgaError = CGAError.getError(statusCode: statusCode)
                
                completed(.failure(cgaError))
                print(error: error, functionName: #function)
                break
            }
        }
        
    }
}




