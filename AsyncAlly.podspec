Pod::Spec.new do |s|
  s.name             = "AsyncAlly"
  s.version          = "0.0.1"
  s.xcconfig         = { 'SWIFT_VERSION' => '4.0' }
  s.summary          = "Simplify Asynchronous Tasks"
  s.description      = "Utilities which support converging of asynchronous tasks"
  s.homepage         = "https://github.com/jac300/AsyncAlly"
  s.license          = 'MIT'
  s.author           = { "Jennifer Clark" => "www.linkedin.com/in/jennifer-clark-0249863" }
  s.source           = { :git => "https://github.com/jac300/AsyncAlly.git", :tag => s.version.to_s }
  s.platform     = :ios, '9.3'
  s.requires_arc = true
  s.source_files = 'AsyncAlly/Classes'
end
