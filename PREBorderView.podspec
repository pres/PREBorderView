Pod::Spec.new do |s|
  s.name         = "PREBorderView"
  s.version      = "3.3.1"
  s.summary      = "A very simple Objective-C UIView category for specifying single-sided borders."
  s.homepage     = "https://github.com/pres/PREBorderView"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { "Paul Steinhilber" => "me@paulsteinhilber.de" }
  s.source       = { :git => "https://github.com/pres/PREBorderView.git", :tag => s.version.to_s }
  s.source_files = 'PREBorderView/{PREBorderLayer,UIView+PREBorderView}.{h,m}'
  s.platform     = :ios, '6.0'
  s.requires_arc = true
end
