Pod::Spec.new do |s|
  s.name             = "Asyncify"
  s.version          = "0.0.2"
  s.summary          = "Simplify Asynchronous Tasking"
  s.description      = "Utilities which support the converging of asynchronous tasks"
  s.homepage         = "https://github.com/jac300/Asyncify"
  s.license          = 'MIT'
  s.author           = { "Jennifer Clark" => "www.linkedin.com/in/jennifer-clark-0249863" }
  s.source           = { :git => "https://github.com/jac300/Asyncify.git", :tag => s.version.to_s }
  s.ios.deployment_target = '8.0'
  s.pod_target_xcconfig = { 'SWIFT_VERSION' => '4.0' }
  s.requires_arc = true
  s.source_files = 'Asyncify/Classes'
end
