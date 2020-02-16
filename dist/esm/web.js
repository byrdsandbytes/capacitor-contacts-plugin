var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
import { WebPlugin } from '@capacitor/core';
export class CapContactsWeb extends WebPlugin {
    constructor() {
        super({
            name: 'CapContacts',
            platforms: ['web']
        });
    }
    echo(options) {
        return __awaiter(this, void 0, void 0, function* () {
            console.log('ECHO in WEB.TS', options);
            return options;
        });
    }
    getPermissions() {
        return __awaiter(this, void 0, void 0, function* () {
            console.log('REQUEST_PERMISSIONS', 'called');
            return {};
        });
    }
    getContacts() {
        return __awaiter(this, void 0, void 0, function* () {
            console.log('GET_CONTACTS', 'called');
            return { contacts: [] };
        });
    }
    getGroups() {
        return __awaiter(this, void 0, void 0, function* () {
            console.log('GET_GROUPS', 'called');
            return { groups: [] };
        });
    }
    getContactGroups() {
        return __awaiter(this, void 0, void 0, function* () {
            console.log('GET_CONTACT_GROUPS', 'called');
            return {};
        });
    }
    deleteContact(options) {
        return __awaiter(this, void 0, void 0, function* () {
            console.log('DELETE_CONTACT', options);
            return {};
        });
    }
    storeContact() {
        return __awaiter(this, void 0, void 0, function* () {
            console.log("StoreContactTrigerred");
            return {};
        });
    }
}
const CapContacts = new CapContactsWeb();
export { CapContacts };
import { registerWebPlugin } from '@capacitor/core';
registerWebPlugin(CapContacts);
//# sourceMappingURL=web.js.map