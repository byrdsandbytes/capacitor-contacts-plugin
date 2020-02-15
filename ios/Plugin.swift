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
        let value = call.getString("value") ?? ""
        call.success([
            "value": value
        ])
    }
}

