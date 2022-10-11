//
//  AVAsset+RKAdd.swift
//  RKTithau
//
//  Created by Rick on 2022/10/11.
//  Copyright © 2022 RickKe. All rights reserved.
//

import AVFoundation

extension AVAsset {
    @MainActor
    func validPlayable() async throws {
        return try await withCheckedThrowingContinuation({ continuation in
            validPlayable { continuation.resume(with: $0) }
        })
    }
    
    func validPlayable(completion: ((Result<(), Error>) -> Void)?) {
        let neededKey = ["playable"]
        self.loadValuesAsynchronously(forKeys: neededKey) {
            var error: NSError?
            let keyStatus = self.statusOfValue(forKey: "playable", error: &error)
            if let error = error {
                completion?(.failure(error))
                return
            }
            if keyStatus == .failed {
                completion?(.failure(AVAssetPlayableError.failedStatus))
                return
            }
            if !self.isPlayable {
                completion?(.failure(AVAssetPlayableError.notPlayable))
                return
            }
            completion?(.success(()))
        }
    }
}

enum AVAssetPlayableError: Error {
    case failedStatus
    case notPlayable
}

extension AVAssetPlayableError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .failedStatus: return "播放狀態失敗"
        case .notPlayable:  return "不可播放"
        }
    }
}
