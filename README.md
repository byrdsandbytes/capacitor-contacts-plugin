# Capacitor Contacts

A native Capcitor plugin to manage phone contacts. Built for Angular hybrid apps.

## Getting Started

### Prerequisites

Setup your project with Capacitor. For details check here: https://capacitor.ionicframework.com/docs/

```
cd my-app
npm install --save @capacitor/core @capacitor/cli
```

Initalize Capacitor

```
npx cap init
```

Add the platforms you want to use.

```
npx cap add android
npx cap add ios
npx cap add electron
```

### Installing

Install:
```
npm i --save @byrds/capacitor-contacts
```
Sync:
````
ionic capacitor sync
````
Run iOS using livereload:
````
ionic capacitor run ios --l
````

## Usage / Examples

You have the following Methods available: 

```
export interface CapContactsPlugin {
  echo(options: { value: string }): Promise<{value: string}>;
  checkPermissions(): Promise<{value: string}>;
  getPermissions(): Promise<any>;
  getContacts(): Promise<{ contacts: Array<any> }>;
  getGroups(): Promise<{ groups: Array<any> }>;
  getContactGroups(): Promise<any>;
  deleteContact(options: { lookupKey: string }): Promise<any>;
  storeContact(): Promise<any>;
}
```
If you're considering to use this plugin you most likely want to retrive contatacts probably want to retrive a users contacts. Here's how I do that: 

Import the Plugin in your TS file: 

```
import { Plugins } from "@capacitor/core";
const  {CapContacts} = Plugins;
```

Next use it and console log the result: 
````
CapContacts.getContacts().then(result => {
    console.log(result);
    for (const contact of result.contacts) {
    console.log(contact);
    }
});

````

That's it. Do Whatever you want with the retrived contacts now result now. 

If you're trying to build something like "contacts matching" based on phone numbers i recommend using google libphonenumber: https://www.npmjs.com/package/google-libphonenumber

In order to match them properly you need to format them before you can match or store them properly.


## iOS Notes

For iOS you need to set use description in your info.plist file.
Open xCode search for your info.plist file and press the tiny "+". Add the following entry: 

````
Privacy - Contacts Usage Description
````

Give it a value like: 

````
We need access to your contacts in order to do something. 
````

## Android Notes

Coming soon. The Android Support is not fully tested yet.

## Electron Notes

Coming soon. The Electron Support is not fully tested yet.

## Built With
- Swift 5 
- Java
- Angular
- Capacitor 

## Authors
-Idrimi (Jonathan Gerber)

## License

GPL v3

## Acknowledgments

* For the java/Android side i took some inspiraton from Skrausler(https://github.com/skrausler)

