Pod::Spec.new do |spec|

  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  spec.name         = 'NimbusSDK'
  spec.version      = '1.9.0'
  spec.summary      = 'The Nimbus SDK is the easiest and fastest way to start using Nimbus on iOS.'

  spec.description  = <<-DESC
                    Nimbus is a disruptive new mobile ad platform that combines an ultra low-latency server-to-server publisher
                    exchange with a flexible, lightweight client-side SDK. With one call to our platform, you get
                    access to a pool of bidders who compete for your impression on a first-price auction, so you
                    get the highest CPMs available, right from the source. Nimbus is designed to do two things well:
                    maximize your revenue and deliver a polished mobile advertising experience to your users.
                   DESC

  spec.homepage          = 'https://www.adsbynimbus.com'
  spec.social_media_url  = 'https://twitter.com/adsbynimbus'
  spec.author            = 'Nimbus'
  spec.platform          = :ios, '10.0'
  spec.documentation_url = 'https://adsbynimbus-public.s3.amazonaws.com/iOS/docs/1.9.0/docs/index.html'
  spec.license           = { :type => 'Copyright', :text => 'Nimbus. All rights reserved.' }

  spec.swift_version         = '5.0'
  spec.ios.deployment_target = '10.0'


  # ――― Source Location ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  spec.source = {
    :http => 'https://adsbynimbus-public.s3.amazonaws.com/iOS/sdks/1.9.0/Nimbus-1.9.0.zip',
    :sha256 => 'd2a778ce63b819c037a58806b539cfb6de5a5c884ebe216ad8cc44bf2b385eed'
  }


  # ――― Subspecs ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

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
    ss.dependency 'FBAudienceNetwork', '6.2.1'
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
    ss.dependency 'GoogleAds-IMA-iOS-SDK', '3.13.0'
  end

  spec.subspec 'NimbusRenderFANKit' do |ss|
    ss.preserve_paths      = '**/NimbusFAN/NimbusRenderFANKit.xcframework'
    ss.vendored_frameworks = '**/NimbusFAN/NimbusRenderFANKit.xcframework'
    ss.dependency 'NimbusSDK/NimbusCoreKit'
    ss.dependency 'NimbusSDK/NimbusRenderKit'
    ss.dependency 'FBAudienceNetwork', '6.2.1'
  end

  spec.subspec 'NimbusKit' do |ss|
    ss.preserve_paths      = '**/NimbusKit.xcframework'
    ss.vendored_frameworks = '**/NimbusKit.xcframework'
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
    ss.source_files   = '**/NimbusGAM/**/*'
    ss.dependency 'NimbusSDK/NimbusCoreKit'
    ss.dependency 'NimbusSDK/NimbusKit'
    ss.dependency 'NimbusSDK/NimbusRenderKit'
    ss.dependency 'NimbusSDK/NimbusRequestKit'
    # ss.dependency 'GoogleMobileAds', '7.6.0'
    ss.dependency 'Google-Mobile-Ads-SDK', '8.2.0.1'
    ss.dependency 'GoogleUtilities', '7.3.1'
    ss.dependency 'nanopb', '2.30907.0'
    ss.dependency 'PromisesObjC', '1.2.12'
  end

end
