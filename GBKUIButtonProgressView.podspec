Pod::Spec.new do |spec|
  spec.name = 'GBKUIButtonProgressView'
  spec.version = '0.1.1'
  spec.summary = 'App Store inspired download progress button.'
  spec.description = 'GBKUIButtonProgressView is an easy to use download progress button.'
  spec.homepage = 'https://github.com/Guidebook/gbkui-button-progress-view'
  spec.license = { type: 'MIT', file: 'LICENSE' }
  spec.source = { git: 'https://github.com/Guidebook/gbkui-button-progress-view', tag: "v#{spec.version}" }
  spec.author = { 'Guidebook' => 'developers@guidebook.com', 'Pete Lada' => 'peter@guidebook.com', 'Mike Sprague' => 'mike@guidebook.com' }

  spec.platform = :ios, '8.0'
  spec.frameworks = 'UIKit'
  spec.source_files = 'GBKUIButtonProgressView/*.{m,h}'
  spec.resources = ['GBKUIButtonProgressView/*.{png,xib}']
end
