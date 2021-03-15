# Uncomment the next line to define a global platform for your project
platform :ios, '14.4'

target 'haniProject' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!


	pod 'Firebase/Analytics'
	pod 'Firebase/Auth'
	pod 'Firebase/Firestore'
	pod 'Firebase/Messaging'
	pod 'Firebase/Storage'
	pod 'Firebase/InAppMessaging'
	pod 'Firebase/Database'
	pod 'Firebase/Core'

	pod 'Alamofire'

	pod 'GoogleSignIn'

	pod 'FBSDKLoginKit'

	pod 'JGProgressHUD'
	

	post_install do |installer|
  	   installer.pods_project.targets.each do |target|
   	      target.build_configurations.each do |config|
         	    config.build_settings['EXCLUDED_ARCHS[sdk=iphonesimulator*]'] = 'arm64'
        	  	   config.build_settings['EXCLUDED_ARCHS[sdk=watchsimulator*]'] = 'arm64'
         	    config.build_settings['EXCLUDED_ARCHS[sdk=appletvsimulator*]'] = 'arm64'
         	   config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '14.4'
          	   config.build_settings['ENABLE_BITCODE'] = 'NO'
     	 end
   	  end
	 end
end