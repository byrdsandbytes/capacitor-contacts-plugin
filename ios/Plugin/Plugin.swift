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

    @objc func getPermissions(_ call: CAPPluginCall) {
        print("checkPermission was triggered in Swift")
        Permissions.contactPermission { granted in
            switch granted {
            case true:
                call.success([
                    "granted": true
                ])
            default:
                call.success([
                    "granted": false
                ])
                }
            }
    }

    @objc func getContacts(_ call: CAPPluginCall) {
        var contactsArray : [PluginResultData] = [];
        Permissions.contactPermission { granted in
            if granted {
                do {
                    let contacts = try Contacts.getContactFromCNContact()

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
                            "displayName": "\(contact.givenName) \(contact.familyName)",
                            "phoneNumbers": phoneNumbers,
                            "emails": emails
                        ]
                        contactsArray.append(contactResult)
                    }
                    call.success([
                        "contacts": contactsArray
                    ])
                } catch let error as NSError {
                    call.error("Generic Error", error)
                }
            } else {
                call.error("User denied access to contacts")
            }
        }
    }

}

