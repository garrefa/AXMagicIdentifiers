#
# Be sure to run `pod lib lint AXMagicIdentifiers.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "AXMagicIdentifiers"
  s.version          = "1.0.4"
  s.summary          = "Categories that automagically adds accessibility identifiers to key objects for test automation"
  s.homepage         = "https://github.com/garrefa/AXMagicIdentifiers"
  s.license          = 'MIT'
  s.author           = { "Alexandre Garrefa" => "alexmrg@gmail.com" }
  s.source           = { :git => "https://github.com/garrefa/AXMagicIdentifiers.git", :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/alexmrg'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'AXMagicIdentifiers' => ['Pod/Assets/*.png']
  }

  s.public_header_files = 'Pod/Classes/*.h'
  s.frameworks = 'UIKit'
  s.dependency 'JRSwizzle', '~> 1.0'
end
