Gem::Specification.new do |s|
  s.name = 'pxlite'
  s.version = '0.2.0'
  s.summary = 'A light-weight version of the Polyrex gem. Intended for traversing nested records 3 levels deep or deeper'
  s.authors = ['James Robertson']
  s.files = Dir['lib/pxlite.rb']
  s.add_runtime_dependency('rxfreader', '~> 0.2', '>=0.2.1')
  s.add_runtime_dependency('polyrex-builder', '~> 0.3', '>=0.3.1')
  s.signing_key = '../privatekeys/pxlite.pem'
  s.cert_chain  = ['gem-public_cert.pem']
  s.license = 'MIT'
  s.email = 'digital.robertson@gmail.com'
  s.homepage = 'https://github.com/jrobertson/pxlite'
end
