//
//  Contacts.swift
//  Plugin
//
//  Created by Jonathan Gerber on 16.02.20.
//  Copyright © 2020 Max Lynch. All rights reserved.
//

import Foundation
import Contacts

class Contacts {
    class func getContactFromCNContact() -> [CNContact] {

        let contactStore = CNContactStore()
        let keysToFetch = [
            CNContactFormatter.descriptorForRequiredKeys(for: .fullName),
            CNContactGivenNameKey,
            CNContactMiddleNameKey,
            CNContactFamilyNameKey,
            CNContactEmailAddressesKey,
            CNContactPhoneNumbersKey
            ] as [Any]

        //Get all the containers
        var allContainers: [CNContainer] = []
        do {
            allContainers = try contactStore.containers(matching: nil)
        } catch {
            print("Error fetching containers")
        }

        var results: [CNContact] = []

        // Iterate all containers and append their contacts to our results array
        for container in allContainers {

            let fetchPredicate = CNContact.predicateForContactsInContainer(withIdentifier: container.identifier)

            do {
                let containerResults = try contactStore.unifiedContacts(matching: fetchPredicate, keysToFetch: keysToFetch as! [CNKeyDescriptor])
                results.append(contentsOf: containerResults)

            } catch {
                print("Error fetching results for container")
            }
        }

        return results
    }
}


