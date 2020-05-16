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
}
