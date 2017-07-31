require_relative '../../views/v1/data_sources'

module V1
  class DataSourcesController < ApiV1
    resource :data_sources do
      get do
        result = DataSource.all.page(params[:page]).per(params[:per_page] || 50)
        DataSources::Views.index(result)
      end

      params do
        requires :name, type: String
        requires :uid, type: String
        requires :external_key, type: String        

        optional :description, type: String     
        optional :some_field, type: Integer     
        optional :some_other_field, type: Integer     
        optional :transaction_value, type: Float     
        optional :transaction_time, type: Time     
        optional :some_string_field, type: String     
        optional :some_other_string_field, type: String     
        optional :items, type: Array[String]     
        optional :item_ids, type: Array[Integer]   
        optional :meta, type: Hash do
          requires :email, type: String   
          requires :domain, type: String   
          requires :url, type: String   
          requires :password, type: String   

          optional :mac, type: String 
          optional :slug, type: String 
          optional :username, type: String 
        end
      end
      post do
        result = DataSource.create!(declared(params, include_missing: false))
        DataSources::Views.show(result)  
      end

      params do
        requires :id, type: Integer 

        optional :description, type: String     
        optional :some_field, type: Integer     
        optional :some_other_field, type: Integer     
        optional :transaction_value, type: Float     
        optional :transaction_time, type: Time     
        optional :some_string_field, type: String     
        optional :some_other_string_field, type: String     
        optional :items, type: Array[String]     
        optional :item_ids, type: Array[Integer]   
        optional :meta, type: Hash do
          optional :email, type: String   
          optional :domain, type: String   
          optional :url, type: String   
          optional :password, type: String   
          optional :mac, type: String 
          optional :slug, type: String 
          optional :username, type: String 
        end
      end
      put ':id' do
        data_source = DataSource.find(params[:id])
        params[:meta] = data_source.meta.merge(params[:meta]) if params[:meta]
        data_source.update!(declared(params, include_missing: false).slice!(:id))
        DataSources::Views.show(data_source)  
      end

      params do
        requires :id, type: Integer 
      end
      get ':id' do
        result = DataSource.find(params[:id])
        DataSources::Views.show(result)  
      end
    end
  end
end
