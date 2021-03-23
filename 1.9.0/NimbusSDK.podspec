#
#  Be sure to run `pod spec lint NimbusCoreKit.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|

  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  These will help people to find your library, and whilst it
  #  can feel like a chore to fill in it's definitely to your advantage. The
  #  summary should be tweet-length, and the description more in depth.
  #

  spec.name         = "NimbusSDK"
  spec.version      = "1.9.0"
  spec.summary      = "NimbusSDK"

  # This description is used to generate tags and improve search results.
  #   * Think: What does it do? Why did you write it? What is the focus?
  #   * Try to keep it short, snappy and to the point.
  #   * Write the description between the DESC delimiters below.
  #   * Finally, don't worry about the indent, CocoaPods strips it!
  spec.description  = <<-DESC
                    NimbusSDK is a core dependency of Nimbus iOS SDK that includes common structs and logging.
                   DESC

  spec.homepage     = "https://www.adsbynimbus.com"
  spec.author       = { "Inder Dhir" => "inderdhir03@gmail.com" }
  spec.platform     = :ios, "10.0"
  spec.documentation_url = "https://adsbynimbus-public.s3.amazonaws.com/iOS/docs/1.9.0/docs/index.html"
  spec.license = { :type => "Copyright", :text => "Nimbus. All rights reserved." }

  # ――― Source Location ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Specify the location from where the source should be retrieved.
  #  Supports git, hg, bzr, svn and HTTP.
  #

  spec.source       = {
    :http => "https://adsbynimbus-public.s3.amazonaws.com/iOS/sdks/1.9.0/Nimbus-1.9.0.zip",
    :sha256 => "d2a778ce63b819c037a58806b539cfb6de5a5c884ebe216ad8cc44bf2b385eed"
  }
  # spec.vendored_frameworks = '**/NimbusAll/xcframeworks/NimbusCoreKit.xcframework'
  spec.swift_version = '5.0'

  # ――― Source Code ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  CocoaPods is smart about how it includes source code. For source files
  #  giving a folder will include any swift, h, m, mm, c & cpp files.
  #  For header files it will include any header in the folder.
  #  Not including the public_header_files will make all headers public.
  #
  spec.default_subspecs = 'NimbusRenderKit'

  spec.subspec 'NimbusCoreKit' do |ss|
    ss.preserve_paths      = '**/NimbusCoreKit.xcframework'
    ss.vendored_frameworks = '**/NimbusCoreKit.xcframework'
  end

  spec.subspec 'NimbusRequestKit' do |ss|
    ss.preserve_paths      = '**/NimbusRequestKit.xcframework'
    ss.vendored_frameworks = '**/NimbusRequestKit.xcframework'
    ss.dependency 'NimbusSDK/NimbusCoreKit'
  end

  spec.subspec 'NimbusRequestAPSKit' do |ss|
    ss.preserve_paths      = '**/NimbusRequestAPSKit.xcframework'
    ss.vendored_frameworks = '**/NimbusRequestAPSKit.xcframework'
    ss.dependency 'NimbusSDK/NimbusCoreKit'
    ss.dependency 'NimbusSDK/NimbusRequestKit'
    ss.dependency 'AmazonPublisherServicesSDK', '3.4.4'
  end

  spec.subspec 'NimbusRequestFANKit' do |ss|
    ss.preserve_paths      = '**/NimbusFAN/NimbusRequestFANKit.xcframework'
    ss.vendored_frameworks = '**/NimbusFAN/NimbusRequestFANKit.xcframework'
    ss.dependency 'NimbusSDK/NimbusCoreKit'
    ss.dependency 'NimbusSDK/NimbusRequestKit'
    ss.dependency 'FBAudienceNetwork', '6.3.0'
    ss.dependency 'FBSDKCoreKit', '9.1.0'
  end

  spec.subspec 'NimbusRenderKit' do |ss|
    ss.preserve_paths      = '**/NimbusRenderKit.xcframework'
    ss.vendored_frameworks = '**/NimbusRenderKit.xcframework'
    ss.dependency 'NimbusSDK/NimbusCoreKit'
  end

  spec.subspec 'NimbusRenderStaticKit' do |ss|
    ss.preserve_paths      = '**/NimbusRenderStaticKit.xcframework'
    ss.vendored_frameworks = '**/NimbusRenderStaticKit.xcframework'
    ss.dependency 'NimbusSDK/NimbusCoreKit'
    ss.dependency 'NimbusSDK/NimbusRenderKit'
  end

  spec.subspec 'NimbusRenderVideoKit' do |ss|
    ss.preserve_paths      = '**/NimbusRenderVideoKit.xcframework'
    ss.vendored_frameworks = '**/NimbusRenderVideoKit.xcframework'
    ss.dependency 'NimbusSDK/NimbusCoreKit'
    ss.dependency 'NimbusSDK/NimbusRenderKit'
    ss.dependency 'GoogleAds-IMA-iOS-SDK', '3.14.1'
  end

  spec.subspec 'NimbusRenderFANKit' do |ss|
    ss.preserve_paths      = '**/NimbusFAN/NimbusRenderFANKit.xcframework'
    ss.vendored_frameworks = '**/NimbusFAN/NimbusRenderFANKit.xcframework'
    ss.dependency 'NimbusSDK/NimbusCoreKit'
    ss.dependency 'NimbusSDK/NimbusRenderKit'
    ss.dependency 'FBAudienceNetwork', '6.3.0'
    ss.dependency 'FBSDKCoreKit', '9.1.0'
  end

  spec.subspec 'NimbusKit' do |ss|
    ss.preserve_paths      = '**/NimbusAll/xcframeworks/NimbusKit.xcframework'
    ss.vendored_frameworks = '**/NimbusAll/xcframeworks/NimbusKit.xcframework'
    ss.dependency 'NimbusSDK/NimbusCoreKit'
    ss.dependency 'NimbusSDK/NimbusRenderKit'
    ss.dependency 'NimbusSDK/NimbusRequestKit'
  end

  spec.subspec 'NimbusMopubKit' do |ss|
    ss.preserve_paths      = '**/NimbusMopubKit.xcframework'
    ss.vendored_frameworks = '**/NimbusMopubKit.xcframework'
    ss.dependency 'NimbusSDK/NimbusCoreKit'
    ss.dependency 'NimbusSDK/NimbusKit'
    ss.dependency 'NimbusSDK/NimbusRenderKit'
    ss.dependency 'NimbusSDK/NimbusRequestKit'
    ss.dependency 'mopub-ios-sdk', '5.16.1'
  end

  spec.subspec 'NimbusGAMKit' do |ss|
    ss.preserve_paths      = '**/NimbusGAM/NimbusGAMKit.xcframework'
    ss.vendored_frameworks = '**/NimbusGAM/NimbusGAMKit.xcframework'
    ss.dependency 'NimbusSDK/NimbusCoreKit'
    ss.dependency 'NimbusSDK/NimbusKit'
    ss.dependency 'NimbusSDK/NimbusRenderKit'
    ss.dependency 'NimbusSDK/NimbusRequestKit'
    ss.dependency 'Google-Mobile-Ads-SDK', '8.2.0.1'
    ss.dependency 'GoogleUtilities', '7.3.1'
    ss.dependency 'nanopb', '2.30907.0'
    ss.dependency 'PromisesObjC', '1.2.12'
  end

end
