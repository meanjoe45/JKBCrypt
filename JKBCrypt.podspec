#
# Be sure to run `pod lib lint JKBCrypt.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
    s.name             = "JKBCrypt"
    s.version          = "0.1.0"
    s.summary          = "An implementation of bcrypt using Swift."

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!
    s.description      = <<-DESC
JKBCrypt is an implementation of bcrypt written in Swift2. It currently is able to generate the salt and hash a phrase using a generated salt. Therefore it allows secure hashing and salt generation with Swift.
                        DESC

    s.homepage         = "https://github.com/koogle/JKBCrypt"
    s.license          = 'MIT'
    s.author           = { "Jakob Frick" => "koogle.frick@gmail.com" }
    s.source           = { :git => "https://github.com/koogle/JKBCrypt.git", :tag => s.version.to_s }
# s.social_media_url = 'https://twitter.com/new_io'

    s.requires_arc = true
    s.ios.deployment_target = '8.0'
#    s.osx.deployment_target = '10.9'
    s.tvos.deployment_target = '9.0'
    s.watchos.deployment_target = '2.0'

    s.source_files = 'Pod/Classes/**/*'
    s.resource_bundles = {
        'JKBCrypt' => ['Pod/Assets/*.png']
    }
end
