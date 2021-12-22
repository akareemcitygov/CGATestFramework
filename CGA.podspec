Pod::Spec.new do |spec|

  spec.name         = "CGA"
  spec.version      = "1.0.1"
  spec.summary      = "To build multiple applications"

  spec.description  = "This framework includes Alamofire so you don't have to add it again in your project, just import CGATestFramework and boom."

  spec.homepage     = "https://github.com/akareemcitygov/CGATestFramework"
  spec.license      = "MIT"
  
  spec.author             = { "Abdul Kareem" => "akareem@citygovapp.com" }
  
  spec.platform     = :ios, "15.0"

  spec.source       = { :git => "https://github.com/akareemcitygov/CGATestFramework.git", :tag => spec.version.to_s }

  #spec.source_files  = "Resources/**/*"

  spec.framework  = "CoreData"
  spec.dependency  'Alamofire', '~> 5.0'
  
  spec.swift_versions = "5.0"
  

end
