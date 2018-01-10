Pod::Spec.new do |s|
  s.name             = "Asyncify"
  s.version          = "0.0.2"
  s.pod_target_xcconfig = { 'CLANG_CXX_LANGUAGE_STANDARD' => 'compiler-default', 'OTHER_CPLUSPLUSFLAGS' => '-std=c++1y $(inherited)' }
  s.summary          = "Simplify Asynchronous Tasking"
  s.description      = "Utilities which support the converging of asynchronous tasks"
  s.homepage         = "https://github.com/jac300/Asyncify"
  s.license          = 'MIT'
  s.author           = { "Jennifer Clark" => "www.linkedin.com/in/jennifer-clark-0249863" }
  s.source           = { :git => "https://github.com/jac300/Asyncify.git", :tag => s.version.to_s }
  s.platform     = :ios, '9.3'
  s.requires_arc = true
  s.source_files = 'Asyncify/Classes'
end
