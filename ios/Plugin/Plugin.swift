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
        print("Echo was triggered")
//        let value = call.getString("value") ?? ""
//        call.success([
//            "allowed": value
//        ])
        Permissions.contactPermission { permission in
            switch permission {
            case true:
                call.success([
                    "allowed": "true"
                ])
            default:
                call.success([
                    "allowed": "false"
                ])
                }
            }
    }
    
    @objc func storeContact(_ call: CAPPluginCall) {
      let name = call.getString("yourName") ?? "default name"
      let address = call.getObject("address") ?? [:]
      let isAwesome = call.getBool("isAwesome") ?? false

      guard let id = call.options["id"] as? String else {
        call.reject("Must provide an id")
        return
      }

      // ...

      call.resolve()
    }
}

