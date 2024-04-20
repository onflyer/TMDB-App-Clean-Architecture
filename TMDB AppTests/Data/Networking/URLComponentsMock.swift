//
//  URLComponentsMock.swift
//  TMDB AppTests
//
//  Created by Aleksandar Milidrag on 4/20/24.
//

import Foundation
@testable import TMDB_App

class URLComponentsMock: URLComponentsProtocol {
    
    var path: String = "https://mock.test.com"
    var httpMethod: HTTPMethod = .GET
    var headers: [String : String] = ["testHeaderKey": "testHeaderValue"]
    var params: [String : Any] = ["testParameterKey": "testparameterValue"]
    var urlParams: [String : String?] = ["testUrlParamskKey": "testUrlParamsValue"]
    
}
