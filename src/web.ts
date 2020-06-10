import { WebPlugin } from '@capacitor/core';
import { CapContactsPlugin, PermissionStatus, Contact } from './definitions';

export class CapContactsWeb extends WebPlugin implements CapContactsPlugin {
  constructor() {
    super({
      name: 'CapContacts',
      platforms: ['web']
    });
  }

  async getPermissions(): Promise<PermissionStatus> {
    throw new Error('getPermission not available');
  }

  async getContacts(): Promise<{contacts: Contact[]}> {
    throw new Error('getContacts not available');
  }




}

const CapContacts = new CapContactsWeb();

export { CapContacts };

import { registerWebPlugin } from '@capacitor/core';
registerWebPlugin(CapContacts);
