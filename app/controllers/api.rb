class Api < Grape::API
  format :json
  formatter :json, -> (object, _env) { Oj.dump(object) }

  mount ApiV1
end
