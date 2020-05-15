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
    @objc func getPermissions(_ call: CAPPluginCall) {
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
            var phoneNumbers: [String] = []
            var emails: [String] = []
            for number in contact.phoneNumbers {
                let numberToAppend = number.value.stringValue
                phoneNumbers.append(numberToAppend)
                print(phoneNumbers)
            }
            for email in contact.emailAddresses {
                let emailToAppend = email.value as String
                emails.append(emailToAppend)
            }
            let contactResult: PluginResultData = [
                "contactId": contact.identifier,
                "lookupKey": contact.identifier,
                "displayName": "\(contact.givenName) \(contact.familyName)",
                "phoneNumbers": phoneNumbers,
                "emails": emails
            ]
            contactsArray.append(contactResult)    
        }
        let data : PluginResultData = ["contacts": contactsArray]
        call.success(data)
        
    }
    
}

