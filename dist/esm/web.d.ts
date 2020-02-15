import { WebPlugin } from '@capacitor/core';
import { CapContactsPlugin } from './definitions';
export declare class CapContactsWeb extends WebPlugin implements CapContactsPlugin {
    constructor();
    echo(options: {
        value: string;
    }): Promise<{
        value: string;
    }>;
}
declare const CapContacts: CapContactsWeb;
export { CapContacts };
