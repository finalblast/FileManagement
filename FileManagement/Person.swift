//
//  Person.swift
//  FileManagement
//
//  Created by Nam (Nick) N. HUYNH on 3/28/16.
//  Copyright (c) 2016 Enclave. All rights reserved.
//

import Foundation

class Person: NSObject, NSCoding {
    
    var firstName: String
    var lastName: String
    
    struct SerializationKey {
    
        static let firstName = "firstName"
        static let lastName = "lastName"
        
    }
    
    init(firstName: String, lastName: String) {
        
        self.firstName = firstName
        self.lastName = lastName
        super.init()
        
    }
    
    convenience override init() {
        
        self.init(firstName: "Nick", lastName: "Huynh")
        
    }
    
    required init(coder aDecoder: NSCoder) {
        
        self.firstName = aDecoder.decodeObjectForKey(SerializationKey.firstName) as String
        self.lastName = aDecoder.decodeObjectForKey(SerializationKey.lastName) as String
        
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        
        aCoder.encodeObject(self.firstName, forKey: SerializationKey.firstName)
        aCoder.encodeObject(self.lastName, forKey: SerializationKey.lastName)
        
    }
    
}

extension Person: Equatable{}

func == (lhs: Person, rhs: Person) -> Bool{
    
    return lhs.firstName == rhs.firstName && lhs.lastName == rhs.lastName ? true : false
    
}
