class PagesController < ApplicationController
    require 'open3'

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

    def execute_terraform_aws_instance1
        # define o caminho para o arquivo .tf que você deseja executar
        file_path = "/Users/robertooliveira/Desktop/Projeto_mestrado/arquivos_terraform/aws_instance1.zip"
      
        # define o comando Terraform a ser executado
        #terraform_command = "terraform init && terraform plan"
     
        terraform_command = "terraform init && terraform plan && terraform apply #{file_path} "
        #terraform_command = "terraform apply #{file_path}"
      
        # executa o comando Terraform usando Open3
        Open3.popen3(terraform_command) do |stdin, stdout, stderr, wait_thr|
          exit_status = wait_thr.value.exitstatus
          if exit_status == 0
            # o comando foi executado com sucesso
            puts "Terraform apply executado com sucesso!"
          else
            # houve um erro na execução do comando
            puts "Erro na execução do Terraform apply: #{stderr.read}"
          end
          end
    end
end
