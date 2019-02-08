Pod::Spec.new do |s|
  s.name             = 'NimbusMraid'
  s.version          = '1.0.2'
  s.summary          = 'Timehop\'s iOS MRAID implementation for Nimbus'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/timehop/mraid-iOS'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Inder Dhir' => 'inderdhir@hotmail.com' }
  s.source           = { :git => 'git@github.com:timehop/mraid-iOS.git', :tag => s.version.to_s }
   s.swift_version   = '4.2'

  s.ios.deployment_target = '11.0'
  s.source_files = 'NimbusMraid/Classes/**/*'
  s.resources = 'NimbusMraid/Assets/mraid.js'
end
