Pod::Spec.new do |s|
  s.name         = 'AXMagicIdentifiers'
  s.version      = '1.0.7'
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.homepage     = 'https://github.com/garrefa/AXMagicIdentifiers'
  s.authors      = { 'Alexandre Garrefa' => 'alexmrg@gmail.com' }
  s.source       = { :git => 'https://github.com/leoneparise/iLog.git', :tag => s.version }
  s.social_media_url = 'https://twitter.com/alexmrg'
  s.platform     = :ios  
  s.ios.deployment_target = '7.0'
  s.requires_arc = true
  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundle = { 'AXMagicIdentifiers' => 'Pod/Assets/*.png' }
  s.public_header_files = 'Pod/Classes/*.h'
  s.framework = 'UIKit'
  s.dependency = 'JRSwizzle', '~> 1.0'
end
