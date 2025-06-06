Pod::Spec.new do |spec|

    # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

    spec.name         = 'NimbusSDK'
    spec.version      = '2.1.0-internal.8'
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
    spec.platform          = :ios, '12.0'
    spec.documentation_url = 'https://adsbynimbus-public.s3.amazonaws.com/dev/iOS/docs/2.1.0-internal.8/docs/index.html'
    spec.license           = { :type => 'Copyright', :text => 'Nimbus. All rights reserved.' }
    spec.swift_version         = '5.0'
    spec.ios.deployment_target = '12.0'
    spec.static_framework = true

    # ――― Source Location ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

    spec.source = {
      :http => 'https://adsbynimbus-public.s3.amazonaws.com/dev/iOS/sdks/2.1.0-internal.8/Nimbus-2.1.0-internal.8.zip',
      :sha256 => '912a50f8cc730931d196ef94ebda5454db5f6d5da1fb3bd2a1427499a9dabfc2'
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
      ss.dependency 'AmazonPublisherServicesSDK', '>=4.5.3'
    end

    spec.subspec 'NimbusRequestFANKit' do |ss|
      ss.source_files = 'NimbusFAN/NimbusRequestFANKit/**/*'
      ss.dependency 'NimbusSDK/NimbusRequestKit'
      ss.dependency 'FBAudienceNetwork', '>=6.11.2'
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
      ss.dependency 'GoogleAds-IMA-iOS-SDK', '3.16.3'
    end

    spec.subspec 'NimbusRenderFANKit' do |ss|
      ss.source_files = 'NimbusFAN/NimbusRenderFANKit/**/*'
      ss.dependency 'NimbusSDK/NimbusRenderKit'
      ss.dependency 'FBAudienceNetwork', '>=6.11.2'
    end

    spec.subspec 'NimbusRenderOMKit' do |ss|
      ss.vendored_frameworks = ['NimbusRenderOMKit.xcframework', 'OMSDK_Adsbynimbus.xcframework']
      ss.dependency 'NimbusSDK/NimbusRenderKit'
    end

    spec.subspec 'NimbusKit' do |ss|
      ss.vendored_frameworks = 'NimbusKit.xcframework'
      ss.dependency 'NimbusSDK/NimbusRequestKit'
      ss.dependency 'NimbusSDK/NimbusRenderKit'
    end

    spec.subspec 'NimbusGAMKit' do |ss|
      ss.source_files   = 'NimbusGAM/NimbusGAMKit/**/*'
      ss.dependency 'NimbusSDK/NimbusKit'
      ss.dependency 'Google-Mobile-Ads-SDK', '>=8.13.0'
      ss.user_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
      ss.pod_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
    end

    spec.subspec 'NimbusUnityKit' do |ss|
      ss.source_files = 'NimbusUnity/NimbusUnityKit/**/*'
      ss.dependency 'NimbusSDK/NimbusKit'
      ss.dependency 'UnityAds', '4.3.0'
    end

    spec.subspec 'NimbusLiveRampKit' do |ss|
      ss.vendored_frameworks = 'NimbusLiveRampKit.xcframework'
      ss.dependency 'NimbusSDK/NimbusRequestKit'
      ss.dependency 'LRAtsSDK', '>=1.3.1'
    end
  end
