import { WebPlugin } from '@capacitor/core';
import { CapContactsPlugin } from './definitions';
export declare class CapContactsWeb extends WebPlugin implements CapContactsPlugin {
    constructor();
    echo(options: {
        value: string;
    }): Promise<{
        value: string;
    }>;
    checkPermissions(): Promise<any>;
    getPermissions(): Promise<any>;
    getContacts(): Promise<{
        contacts: Array<any>;
    }>;
    getGroups(): Promise<{
        groups: Array<any>;
    }>;
    getContactGroups(): Promise<any>;
    deleteContact(options: {
        lookupKey: string;
    }): Promise<any>;
    storeContact(): Promise<any>;
}
declare const CapContacts: CapContactsWeb;
export { CapContacts };
