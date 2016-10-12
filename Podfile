# Uncomment this line to define a global platform for your project
# platform :ios, '9.0'

def rx_swift
    pod 'RxSwift',    '~> 2.0'
    pod 'RxCocoa',    '~> 2.0'
end

target 'DemoMvvm' do
  # Comment this line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!
  rx_swift
  # Pods for DemoMvvm

  target 'DemoMvvmTests' do
    inherit! :search_paths
    # Pods for testing
    rx_swift
  end

  target 'DemoMvvmUITests' do
    inherit! :search_paths
    # Pods for testing
    rx_swift
  end

end
