//===--- Request.swift ------------------------------------------------------===//
//Copyright (c) 2016 Crossroad Labs s.r.o.
//
//Licensed under the Apache License, Version 2.0 (the "License");
//you may not use this file except in compliance with the License.
//You may obtain a copy of the License at
//
//http://www.apache.org/licenses/LICENSE-2.0
//
//Unless required by applicable law or agreed to in writing, software
//distributed under the License is distributed on an "AS IS" BASIS,
//WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//See the License for the specific language governing permissions and
//limitations under the License.
//===----------------------------------------------------------------------===//

import Foundation

import Alamofire

import ExecutionContext
import Future

public extension Alamofire.DataRequest {
    //TODO: pass queue???
    public func response() -> Future<Data> {
        let p = Promise<Data>()
        
        self.response { response in
            if let error = response.error {
                try! p.fail(error: error)
            } else if let success = response.data {
                try! p.success(value: success)
            } else {
                fatalError("WTF?")
            }
        }
        
        return p.future
    }
    
    public func responseData() -> Future<Data> {
        let p = Promise<Data>()
        
        self.responseData { response in
            try! p.complete(result: response.result.result)
        }
        
        return p.future
    }
    
    public func responseString(encoding: String.Encoding?) -> Future<String> {
        let p = Promise<String>()
        
        self.responseString(encoding: encoding) { response in
            try! p.complete(result: response.result.result)
        }
        
        return p.future
    }
    
    public func responseJSON() -> Future<Any> {
        let p = Promise<Any>()
        
        self.responseJSON { response in
            try! p.complete(result: response.result.result)
        }
        
        return p.future
    }
    
    public func responsePropertyList() -> Future<Any> {
        let p = Promise<Any>()
        
        self.responsePropertyList { response in
            try! p.complete(result: response.result.result)
        }
        
        return p.future
    }
}
