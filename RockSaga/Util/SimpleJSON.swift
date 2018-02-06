//
//  SimpleJSON
//  RockSaga
//
//  Created by Charles Ferreira on 31/01/2018.
//  Copyright © 2018 Charles Ferreira. All rights reserved.
//

import Foundation

class SimpleJSON {
    
    // todo: Melhorar o error handling
    static func read<T>(_ type: T.Type, fromResource resource: String) -> T where T: Decodable {
        let path = Bundle.main.path(forResource: resource, ofType: "json")
        let url = URL(fileURLWithPath: path!)
        let data = try! Data(contentsOf: url)
        return try! JSONDecoder().decode(T.self, from: data)
    }
    
}
