//
//  Plugin.swift
//  
//
//  Created by Jonathan Gerber on 15.02.20.
//  © Byrds & Bytes GmbH - Jonathan Gerber

import Foundation
import Capacitor
import SwiftyJSON


@objc(CapContacts)
public class CapContacts: CAPPlugin {
    
    @objc func echo(_ call: CAPPluginCall) {
        print("Echo was triggered in Swift")
        let value = call.getString("value") ?? ""
        call.success([
            "allowed": value
        ])
    }
    @objc func checkPermissions(_ call: CAPPluginCall) {
        print("checkPermission was triggered in Swift")
        Permissions.contactPermission { permission in
            switch permission {
            case true:
                call.success([
                    "allowed": true
                ])
            default:
                call.success([
                    "allowed": false
                ])
                }
            }
    }
    @objc func getContacts(_ call: CAPPluginCall) {
        let contacts = Contacts.getContactFromCNContact()
        let json = JSON(contacts)
        print(json)
        for contact in contacts {
            print(contact.middleName)
            print(contact.familyName)
            print(contact.givenName)
        }
        
    }
    
    
}

