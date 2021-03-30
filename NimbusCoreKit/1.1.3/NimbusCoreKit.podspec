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

  spec.name         = "NimbusCoreKit"
  spec.version      = "1.1.3"
  spec.summary      = "NimbusCoreKit is a core dependency of Nimbus iOS SDK"

  # This description is used to generate tags and improve search results.
  #   * Think: What does it do? Why did you write it? What is the focus?
  #   * Try to keep it short, snappy and to the point.
  #   * Write the description between the DESC delimiters below.
  #   * Finally, don't worry about the indent, CocoaPods strips it!
  spec.description  = <<-DESC
                    NimbusCoreKit is a core dependency of Nimbus iOS SDK that includes common structs and logging.
                   DESC

  spec.homepage     = "https://www.adsbynimbus.com"
  spec.author             = { "Inder Dhir" => "inderdhir03@gmail.com" }
  spec.platform     = :ios, "10.0"
  spec.documentation_url = "https://s3.amazonaws.com/nimbus.public/iOS/docs/1.1.3/docs/index.html"
  spec.license = { :type => "Copyright", :text => "Nimbus. All rights reserved." }

  # ――― Source Location ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Specify the location from where the source should be retrieved.
  #  Supports git, hg, bzr, svn and HTTP.
  #

  spec.source       = { 
    :http => "https://s3.amazonaws.com/nimbus.public/iOS/sdks/1.1.3/Nimbus-1.1.3.zip",
    :sha256 => "2dcf612778284a881851e67011099667d3480120bc79b38b8c76d454661eb712"
  }
  spec.vendored_frameworks = '**/NimbusAll/xcframeworks/NimbusCoreKit.xcframework'
  # spec.preserve_paths = 'NimbusAll/NimbusCoreKit.xcframework'
  spec.swift_version = '5.0'

  # ――― Source Code ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  CocoaPods is smart about how it includes source code. For source files
  #  giving a folder will include any swift, h, m, mm, c & cpp files.
  #  For header files it will include any header in the folder.
  #  Not including the public_header_files will make all headers public.
  #
end
