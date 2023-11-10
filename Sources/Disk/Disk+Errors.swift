// The MIT License (MIT)
//
// Copyright (c) 2017 Saoud Rizwan <hello@saoudmr.com>
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

import Foundation

public struct DiskError: Swift.Error {
    public let code: Code
    public let _description: String?
    public let _failureReason: String?
    public let _recoverySuggestion: String?
    
    public init(code: Code, _description: String?, _failureReason: String?, _recoverySuggestion: String?) {
        self.code = code
        self._description = _description
        self._failureReason = _failureReason
        self._recoverySuggestion = _recoverySuggestion
    }
}

extension DiskError {
    public enum Code {
        case noFileFound
        case serialization
        case deserialization
        case invalidFileName
        case couldNotAccessTemporaryDirectory
        case couldNotAccessUserDomainMask
        case couldNotAccessSharedContainer
    }
}
extension DiskError: LocalizedError {
    public var errorDescription: String? {
        _description
    }
    
    public var failureReason: String? {
        _failureReason
    }
    
    public var recoverySuggestion: String? {
        _recoverySuggestion
    }
}

extension Disk {
    
    /// Create custom error that FileManager can't account for
    static func createError(_ errorCode: DiskError.Code, description: String?, failureReason: String?, recoverySuggestion: String?) -> DiskError {
        return DiskError(
            code: errorCode,
            _description: description,
            _failureReason: failureReason,
            _recoverySuggestion: recoverySuggestion
        )
    }
}

