Pod::Spec.new do |s|
  s.name             = 'BiometricAuthenticator'
  s.version          = '1.4.0'
  s.summary          = 'An easy to use wrapper around the standard iOS biometric authentication methods.'

  s.description      = <<-DESC
BiometricAuthenticator aims to ease the process of incorporating the use of TouchID and FaceID in your iOS app. At its core, BiometricAuthenticator provides an intuitive API to simplify the steps needed a modern and secure
                       DESC

  s.homepage         = 'https://github.com/Chris-Corea/BiometricAuthenticator'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Christopher Corea' => 'ccorea22@gmail.com' }
  s.source           = { :git => 'https://github.com/Chris-Corea/BiometricAuthenticator.git', :tag => s.version.to_s }

  s.ios.deployment_target = '9.0'

  s.source_files = 'BiometricAuthenticator/Classes/**/*'

end
