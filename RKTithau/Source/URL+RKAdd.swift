//
//  URL+RKAdd.swift
//  RKTithau
//
//  Created by Rick on 2022/10/11.
//  Copyright © 2022 RickKe. All rights reserved.
//

import Foundation

extension URL {
    func ping() async throws -> String {
        return try await withCheckedThrowingContinuation { continuation in
            ping { continuation.resume(with: $0) }
        }
    }
    
    func ping(completion: ((Result<String, Error>) -> Void)?) {
        var request = URLRequest(url: self)
        request.httpMethod = "HEAD"
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let httpResponse = response as? HTTPURLResponse,
                  let link = httpResponse.url?.absoluteString
            else {
                completion?(.failure(NSError(domain: "轉換不過HTTPURLResponse", code: 0)))
                return
            }
            let code = httpResponse.statusCode
            if code == 200 {
                completion?(.success(link))
            } else {
                completion?(.failure(NSError(domain: "statusCode 非 200", code: code)))
            }
        }.resume()
    }
    
    func pingTsFormat() async throws -> String {
        return try await withCheckedThrowingContinuation { continuation in
            ping { continuation.resume(with: $0) }
        }
    }
    
    /// 串流影音的.ts檔案, 因為切片系統會莫名只有切16byte
    func pingTsFormat(completion: ((Result<String, Error>) -> Void)?) {
        var request = URLRequest(url: self)
        request.httpMethod = "HEAD"
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let httpResponse = response as? HTTPURLResponse,
                  let link = httpResponse.url?.absoluteString,
                  let len = httpResponse.value(forHTTPHeaderField: "Content-Length")
            else {
                completion?(.failure(NSError(domain: "轉換不過HTTPURLResponse", code: 0)))
                return
            }
            let code = httpResponse.statusCode
            if code == 200, len.toInteger > 16 {
                completion?(.success(link))
            } else {
                completion?(.failure(NSError(domain: "statusCode 非 200", code: code)))
            }
        }.resume()
    }
}
