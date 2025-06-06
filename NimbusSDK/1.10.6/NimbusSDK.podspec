Pod::Spec.new do |spec|

    # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

    spec.name         = 'NimbusSDK'
    spec.version      = '1.10.6'
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
    spec.documentation_url = 'https://adsbynimbus-public.s3.amazonaws.com/iOS/docs/1.10.5/docs/index.html'
    spec.license           = { :type => 'Copyright', :text => 'Nimbus. All rights reserved.' }
    spec.swift_version         = '5.0'
    spec.ios.deployment_target = '10.0'
    spec.static_framework = true

    # ――― Source Location ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

    spec.source = {
      :http => 'https://adsbynimbus-public.s3.amazonaws.com/dev/iOS/Nimbus-1.10.6.zip',
      :sha256 => 'b8c684cc9b43c60a6c57997442f414614b4f5665794068606638c591bd7b5ea9'
    }

    # ――― Subspecs ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

    spec.default_subspecs = 'NimbusKit'

    spec.subspec 'NimbusCoreKit' do |ss|
      ss.vendored_frameworks = 'NimbusCoreKit.xcframework'
    end

    spec.subspec 'NimbusRequestKit' do |ss|
      ss.vendored_frameworks = 'NimbusRequestKit.xcframework'
      ss.dependency 'NimbusSDK/NimbusCoreKit'
    end

    spec.subspec 'NimbusRequestAPSKit' do |ss|
      ss.vendored_frameworks = 'NimbusRequestAPSKit.xcframework'
      ss.dependency 'NimbusSDK/NimbusRequestKit'
      ss.dependency 'AmazonPublisherServicesSDK', '3.4.6'
      ss.user_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }
      ss.pod_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }
    end

    spec.subspec 'NimbusRequestFANKit' do |ss|
      ss.source_files = 'NimbusFAN/NimbusRequestFANKit/**/*'
      ss.dependency 'NimbusSDK/NimbusRequestKit'
      ss.dependency 'FBAudienceNetwork', '6.6.0'
    end

    spec.subspec 'NimbusRenderKit' do |ss|
      ss.vendored_frameworks = 'NimbusRenderKit.xcframework'
      ss.dependency 'NimbusSDK/NimbusCoreKit'
    end

    spec.subspec 'NimbusRenderStaticKit' do |ss|
      ss.vendored_frameworks = 'NimbusRenderStaticKit.xcframework'
      ss.dependency 'NimbusSDK/NimbusRenderKit'
    end

    spec.subspec 'NimbusRenderVideoKit' do |ss|
      ss.vendored_frameworks = 'NimbusRenderVideoKit.xcframework'
      ss.dependency 'NimbusSDK/NimbusRenderKit'
      ss.dependency 'GoogleAds-IMA-iOS-SDK', '3.13.0'
      ss.user_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }
      ss.pod_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }
    end

    spec.subspec 'NimbusRenderFANKit' do |ss|
      ss.source_files = 'NimbusFAN/NimbusRenderFANKit/**/*'
      ss.dependency 'NimbusSDK/NimbusRenderKit'
      ss.dependency 'FBAudienceNetwork', '>=6.6.0'
    end

    spec.subspec 'NimbusKit' do |ss|
      ss.vendored_frameworks = 'NimbusKit.xcframework'
      ss.dependency 'NimbusSDK/NimbusRequestKit'
      ss.dependency 'NimbusSDK/NimbusRenderKit'
    end

    spec.subspec 'NimbusGAMKit' do |ss|
      ss.source_files   = 'NimbusGAM/NimbusGAMKit/**/*'
      ss.dependency 'NimbusSDK/NimbusKit'
      ss.dependency 'Google-Mobile-Ads-SDK', '>=8.9.0'
      ss.user_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
      ss.pod_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
    end

    spec.subspec 'NimbusMopubKit' do |ss|
      ss.source_files = 'NimbusMopub/NimbusMopubKit/**/*'
      ss.dependency 'NimbusSDK/NimbusKit'
      ss.dependency 'mopub-ios-sdk', '>=5.17.0'
    end

  end
