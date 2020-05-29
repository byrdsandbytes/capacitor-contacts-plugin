declare module "@capacitor/core" {
  interface PluginRegistry {
    CapContacts: CapContactsPlugin;
  }
}

export interface PermissionStatus {
  granted: boolean;
}

export interface Contact {
  contactId: string;
  displayName?: string;
  phoneNumbers: string[];
  emails: string[];
  organizationName?: string;
  organizationRole?: string;
  birthday?: string;
}

export interface CapContactsPlugin {
  getPermissions(): Promise<PermissionStatus>;
  getContacts(): Promise<{contacts: Contact[]}>;
}
