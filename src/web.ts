import { WebPlugin } from '@capacitor/core';
import { CapContactsPlugin } from './definitions';

export class CapContactsWeb extends WebPlugin implements CapContactsPlugin {
  constructor() {
    super({
      name: 'CapContacts',
      platforms: ['web']
    });
  }

  async echo(options: { value: string }): Promise<{value: string}> {
    console.log('ECHO', options);
    return options;
  }

   async getPermissions(): Promise<any> {
        console.log('REQUEST_PERMISSIONS', 'called');
        return {};
    }

    async getContacts(): Promise<{ contacts: Array<any> }> {
        console.log('GET_CONTACTS', 'called');
        return {contacts: []};
    }

    async getGroups(): Promise<{ groups: Array<any> }> {
        console.log('GET_GROUPS', 'called');
        return {groups: []};
    }

    async getContactGroups(): Promise<any> {
        console.log('GET_CONTACT_GROUPS', 'called');
        return {};
    }

    async deleteContact(options: { lookupKey: string }): Promise<any> {
        console.log('DELETE_CONTACT', options);
        return {};
    }

    async storeContact(): Promise<any> {
      console.log("StoreContactTrigerred");
      return {};

    }

}

const CapContacts = new CapContactsWeb();

export { CapContacts };

import { registerWebPlugin } from '@capacitor/core';
registerWebPlugin(CapContacts);
