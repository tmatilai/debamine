# Guardfile
# More info at https://github.com/guard/guard#readme

guard 'foodcritic', :cookbook_paths => 'site-cookbooks' do

  [ 'metadata\.rb',
    '(attributes|libraries|providers|recipes|resources)/.+\.rb',
    'templates/.+\.erb'
  ].each do |pattern|
    watch(%r{^(site-cookbooks/[^/]+/)#{pattern}$}) {|m| m[1]}
  end
end
