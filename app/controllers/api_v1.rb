class ApiV1 < Grape::API
  version 'v1'
  format :json
  formatter :json, -> (object, _env) { Oj.dump(object) }

  get '/hello' do
    'hello'
  end

  mount V1::DataSourcesController
end
