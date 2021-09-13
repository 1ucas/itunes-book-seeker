# Uncomment the next line to define a global platform for your project
platform :ios, '13.0'
inhibit_all_warnings!

target 'BookSeeker' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  def rxswift_pods
    pod 'RxSwift'
    pod 'RxCocoa'
  end

  def networking_pods
    pod 'Alamofire', '5.4.3'
  end

  def kingfisher_pods
    pod 'Kingfisher', '~> 5.0'
  end

  def dependency_injection_pods
    pod 'Swinject'
  end

  def reusepods
      networking_pods
      rxswift_pods
      kingfisher_pods
      dependency_injection_pods
  end

  def test_pods
    pod 'Quick'
    pod 'Nimble'
  end
  

  # Pods for BookSeeker
  reusepods
  pod 'SwiftLint', '~> 0.33'

  target 'BookSeekerTests' do
    inherit! :search_paths
    test_pods
    pod 'Swifter', '~> 1.5.0'
  end

  target 'BookSeekerUITests' do
    inherit! :search_paths
    test_pods
    reusepods
  end

end
