declare module "@capacitor/core" {
    interface PluginRegistry {
        CapContacts: CapContactsPlugin;
    }
}
export interface CapContactsPlugin {
    echo(options: {
        value: string;
    }): Promise<{
        value: string;
    }>;
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
