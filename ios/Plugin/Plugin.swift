//
//  Plugin.swift
//  
//
//  Created by Jonathan Gerber on 15.02.20.
//  © Byrds & Bytes GmbH - Jonathan Gerber

import Foundation
import Capacitor


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
        var contactsArray : [PluginResultData] = [];
        let contacts = Contacts.getContactFromCNContact()
        for contact in contacts {
            let jsResult: PluginResultData = [
                "lastName": contact.familyName,
                "firstName": contact.givenName,
                "phoneNumberRaw": contact.phoneNumbers.first?.value.stringValue ?? "nA",
            ]
            contactsArray.append(jsResult)
            print(contact.middleName)
            print(contact.familyName)
            print(contact.givenName)
            print(contact.phoneNumbers.first?.value.stringValue ?? "nA")
            
        }
        let data : PluginResultData = ["contacts": contactsArray]
        call.success(data)
        
    }
    
}

