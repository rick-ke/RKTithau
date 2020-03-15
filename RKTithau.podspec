Pod::Spec.new do |s|
  s.name         = "RKTithau"
  s.version      = "0.0.1"
  s.summary      = "RKTithau is a tool to increase rapid development"

  s.description  = <<-DESC
  【iOS】【Swift】RKTithau is a tool to increase rapid development
                   DESC

  s.homepage     = "https://github.com/rick-ke/RKTithau"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = "Rick Ke"

  s.swift_version = '5.0'
  s.ios.deployment_target = '10.0'
  s.platform     = :ios, "10.0"

  s.source       = { :git => "https://github.com/rick-ke/RKTithau.git", :tag => "#{s.version}" }
  s.source_files = "RKTithau/Source/**/*"

  s.requires_arc = true

end
