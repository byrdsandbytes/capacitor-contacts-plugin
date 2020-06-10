# Capacitor Contacts

A native Capcitor plugin to manage phone contacts. Built for Angular hybrid apps.

## Demo

You can find a working Ionic App using the Byrds' Capacitor Contacts plugin here:
https://github.com/byrdsandbytes/capContactsDemo

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
  getPermissions(): Promise<PermissionStatus>;
  getContacts(): Promise<{contacts: Contact[]}>;
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

### Interfaces
`````
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
`````


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

For Android you have to add the permision in you AndroidManifest.xml. Add the following permission before the closing of the "manifest" tag.

````
<uses-permission android:name="android.permission.READ_CONTACTS" />
<uses-permission android:name="android.permission.WRITE_CONTACTS"/>
````

Next import the capContacts class to your MainActivity

`````
// Initializes the Bridge
    this.init(savedInstanceState, new ArrayList<Class<? extends Plugin>>() {{
      // Additional plugins you've installed go here
      // Ex: add(TotallyAwesomePlugin.class);
      add(CapContacts.class);
    }});
`````

Make sure to import it properly as well.

``````
import ch.byrds.capacitorContacts.CapContacts;
``````

**NOTE**: On Android you have to ask for permission first, before you can fetch the contacts. Use the `getPermissions()` method before you try to fetch contacts using `getContacts()`.





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



