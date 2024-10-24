Pod::Spec.new do |spec|

    # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

    spec.name         = 'NimbusSDK'
    spec.version      = '2.22.1-internal1'
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
    spec.documentation_url = 'https://docs.adsbynimbus.com/docs/sdk/ios'
    spec.license           = { :type => 'Copyright', :text => 'Nimbus. All rights reserved.' }
    spec.swift_version         = '5.0'
    spec.ios.deployment_target = '12.0'
    spec.static_framework = true

    # ――― Source Location ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

    spec.source = {
      :http => 'https://adsbynimbus-public.s3.amazonaws.com/dev/iOS/sdks/2.22.1-internal1/Nimbus-2.22.1-internal1.zip',
      :sha256 => '753f46423e73419174689a850378d460f66665502341001e116a7f8b519eff38'
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
      ss.dependency 'AmazonPublisherServicesSDK', '>=4.9.3'
    end

    spec.subspec 'NimbusRequestFANKit' do |ss|
      ss.source_files = 'NimbusFAN/NimbusRequestFANKit/**/*'
      ss.dependency 'NimbusSDK/NimbusRequestKit'
      ss.dependency 'FBAudienceNetwork', '>=6.15.0'
    end

    spec.subspec 'NimbusRenderKit' do |ss|
      ss.vendored_frameworks = ['NimbusRenderKit.xcframework', 'OMSDK_Adsbynimbus.xcframework']
      ss.dependency 'NimbusSDK/NimbusCoreKit'
    end

    spec.subspec 'NimbusRenderStaticKit' do |ss|
      ss.vendored_frameworks = 'NimbusRenderStaticKit.xcframework'
      ss.dependency 'NimbusSDK/NimbusRenderKit'
    end

    spec.subspec 'NimbusRenderVideoKit' do |ss|
      ss.vendored_frameworks = 'NimbusRenderVideoKit.xcframework'
      ss.dependency 'NimbusSDK/NimbusRenderKit'
      ss.dependency 'GoogleAds-IMA-iOS-SDK', '>=3.18.4'
    end

    spec.subspec 'NimbusRenderVASTKit' do |ss|
      ss.vendored_frameworks = 'NimbusRenderVASTKit.xcframework'
      ss.dependency 'NimbusSDK/NimbusRenderStaticKit'
    end

    spec.subspec 'NimbusRenderFANKit' do |ss|
      ss.source_files = 'NimbusFAN/NimbusRenderFANKit/**/*'
      ss.dependency 'NimbusSDK/NimbusRenderKit'
      ss.dependency 'FBAudienceNetwork', '>=6.15.0'
    end

    spec.subspec 'NimbusKit' do |ss|
      ss.vendored_frameworks = ['NimbusKit.xcframework']
      ss.dependency 'NimbusSDK/NimbusRequestKit'
      ss.dependency 'NimbusSDK/NimbusRenderKit'
      ss.dependency 'NimbusSDK/NimbusRenderStaticKit'
      ss.dependency 'NimbusSDK/NimbusRenderVideoKit'
    end

    spec.subspec 'NimbusGAMKit' do |ss|
      ss.source_files = 'NimbusGAM/NimbusGAMKit/**/*'
      ss.dependency 'NimbusSDK/NimbusKit'
      ss.dependency 'Google-Mobile-Ads-SDK', '>=9.0.0'
    end

    spec.subspec 'NimbusAdMobKit' do |ss|
      ss.source_files = 'NimbusAdMob/NimbusAdMobKit/**/*'
      ss.dependency 'NimbusSDK/NimbusKit'
      ss.dependency 'Google-Mobile-Ads-SDK', '>=11.7.0'
    end

    spec.subspec 'NimbusGoogleKit' do |ss|
      ss.source_files = 'NimbusGoogle/NimbusGoogleKit/**/*'
      ss.dependency 'NimbusSDK/NimbusKit'
      ss.dependency 'Google-Mobile-Ads-SDK', '>=9.0.0'
    end

    spec.subspec 'NimbusUnityKit' do |ss|
      ss.source_files = 'NimbusUnity/NimbusUnityKit/**/*'
      ss.dependency 'NimbusSDK/NimbusKit'
      ss.dependency 'UnityAds', '>=4.9.2'
    end

    spec.subspec 'NimbusLiveRampKit' do |ss|
      ss.source_files = 'NimbusLiveRamp/NimbusLiveRampKit/**/*'
      ss.dependency 'NimbusSDK/NimbusLiveRampKitCompat'
      ss.dependency 'NimbusSDK/NimbusRequestKit'
      ss.dependency 'LRAtsSDK', '>= 1.4'
    end

    spec.subspec 'NimbusVungleKit' do |ss|
      ss.source_files = 'NimbusVungle/NimbusVungleKit/**/*'
      ss.dependency 'NimbusSDK/NimbusKit'
      ss.dependency 'VungleAds', '>=7.2.1'
    end

    spec.subspec 'NimbusMobileFuseKit' do |ss|
      ss.source_files = 'NimbusMobileFuse/NimbusMobileFuseKit/**/*'
      ss.dependency 'NimbusSDK/NimbusKit'
      ss.dependency 'MobileFuseSDK', '~> 1.7'
    end

    # Compat specs to be removed in the next major version update

    spec.subspec 'NimbusLiveRampKitCompat' do |ss|
      ss.vendored_frameworks = 'NimbusLiveRampKit.xcframework'
      ss.dependency 'NimbusSDK/NimbusRequestKit'
    end

    spec.subspec 'NimbusRenderOMKit' do |ss|
      ss.vendored_frameworks = 'NimbusRenderOMKit.xcframework'
      ss.dependency 'NimbusSDK/NimbusRenderKit'
    end
  
  end
