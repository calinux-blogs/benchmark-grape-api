desc 'Print compiled grape routes'
task :routes do
  require 'grape'
  require_relative '../../config/environment'
  require_relative '../../app/controllers/api_v1'

  mapped_prefix = '' # where mounted in routes.rb
  format = "%46s  %3s %7s %50s %12s:  %s"
  ApiV1.routes.each do |route|
    info = route.instance_variable_get :@options
    puts format % [
      info[:description] ? info[:description][0..45] : '',
      info[:version],
      info[:method],
      mapped_prefix + info[:namespace],
      '# params: ' + info[:params].length.to_s,
      info[:params].first.inspect
    ]
    if info[:params].length > 1
      info[:params].each_with_index do |param_info, index|
        next if index == 0
        puts format % ['','','','','',param_info.inspect]
      end
    end
  end
end
