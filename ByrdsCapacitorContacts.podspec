
  Pod::Spec.new do |s|
    s.name = 'ByrdsCapacitorContacts'
    s.version = '0.0.1'
    s.summary = 'A capacitor plugin to fetch contacts'
    s.license = 'GPL v3'
    s.homepage = 'https://github.com/byrdsandbytes/capacitor-contacts-plugin.git'
    s.author = 'Byrds & Bytes Gmbh / Idrimi / Jonathan Gerber'
    s.source = { :git => 'https://github.com/byrdsandbytes/capacitor-contacts-plugin.git', :tag => s.version.to_s }
    s.source_files = 'ios/Plugin/**/*.{swift,h,m,c,cc,mm,cpp}'
    s.ios.deployment_target  = '11.0'
    s.dependency 'Capacitor'
  end