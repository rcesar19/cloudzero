class PagesController < ApplicationController
    def index
    end

    def pagina_azure
        render 'azure'
    end

    def pagina_aws
        render 'aws'
    end

    def pagina_gcp
        render 'gcp'
    end
end
