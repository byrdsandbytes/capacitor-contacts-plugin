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
    console.log("GET PERMISSIONS")
    return
  }

  async getContacts(): Promise<{contacts: Array<any>}> {
    console.log("GET CONTACTS")
    return

  }




}

const CapContacts = new CapContactsWeb();

export { CapContacts };

import { registerWebPlugin } from '@capacitor/core';
registerWebPlugin(CapContacts);
