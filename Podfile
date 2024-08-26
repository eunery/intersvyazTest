# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'intersvyazTest' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for intersvyazTest
  pod 'SnapKit', '~> 5.6.0'
  pod 'CocoaDebug', '~> 1.7.2', :configurations => ['Debug']
  pod 'Resolver', '~> 1.5.0'
  pod 'SDWebImage', '~> 5.17.0'

end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings.delete 'IPHONEOS_DEPLOYMENT_TARGET'
    end
  end
end