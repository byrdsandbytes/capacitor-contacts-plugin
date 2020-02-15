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
}

const CapContacts = new CapContactsWeb();

export { CapContacts };

import { registerWebPlugin } from '@capacitor/core';
registerWebPlugin(CapContacts);
