Pod::Spec.new do |s|

  s.name         = "CGRectExtensions"
  s.version      = "2.0"
  s.summary      = "A collection of `CGRect`, `CGPoint` and `CGSize` convenience functions for Swift on OS X and iOS.."

  s.description  = <<-DESC
                   The goal is to provide clear functions for the most commonly used rect operations, even if the code savings are minimal. The reason is that function names communicate the programmer's intent more clearly than setting properties with ad-hoc calculations.
                   DESC

  s.homepage     = "https://github.com/nschum/SwiftCGRectExtensions"
  s.license      = "MIT"
  s.author       = { "Nikolaj Schumacher" => "me@nschum.de" }

  s.ios.deployment_target = "8.0"
  s.osx.deployment_target = "10.9"

  s.source       = { :git => "https://github.com/nschum/SwiftCGRectExtensions.git", :tag => "2.0" }
  s.source_files = "CGRectExtensions/*.swift"
  s.frameworks   = ["Foundation"]
end
