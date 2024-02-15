# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'ewarga-ios' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
post_install do |installer|
installer.generated_projects.each do |project|
      project.targets.each do |target|
          target.build_configurations.each do |config|
              config.build_settings['ONLY_ACTIVE_ARCH'] = 'NO'
              config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '11.0'
           end
      end
   end
end

  # Pods for ewarga-ios

  target 'ewarga-iosTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'ewarga-iosUITests' do
    # Pods for testing
  end

end
