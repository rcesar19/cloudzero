class PagesController < ApplicationController
    require 'open3'
    include TerraformHelper

    def index
      #@public_ip = get_terraform_output
      #@public_ip = `terraform output public_ip`

    end

    def awssuccess
      @instance_id = `terraform output instance_id`.strip
      @public_ip = `terraform output public_ip`
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
        file_path = "/Users/robertooliveira/Desktop/Projeto_mestrado/arquivos_terraform/AWS/aws_instance1.tf.zip"
      
        Dir.chdir("/Users/robertooliveira/Desktop/Projeto_mestrado/arquivos_terraform/AWS")
        system("terraform init")       
        system("terraform plan -out=planfile")   
        # define o comando Terraform a ser executado
        #terraform_command = "terraform init && terraform plan"
     
        #terraform_command = "terraform init && terraform plan && terraform apply #{file_path} "
        
        #terraform_command = "terraform apply #{file_path}"
        terraform_command = "terraform apply planfile"
      
        # executa o comando Terraform usando Open3
        Open3.popen3(terraform_command) do |stdin, stdout, stderr, wait_thr|
          exit_status = wait_thr.value.exitstatus
          if exit_status == 0
            # o comando foi executado com sucesso
            puts "Terraform apply executado com sucesso! from pages controller"
            #render turbo_stream: turbo_stream.replace('terraform_output', partial: 'terraform_output')
            #render partial: 'pages/terraform_output'
            @instance_id = `terraform output instance_id`.strip
            @public_ip = `terraform output public_ip`
            redirect_to awssuccess_path
          else
            # houve um erro na execução do comando
            puts "Erro na execução do Terraform apply: #{stderr.read}"
            render turbo_stream: turbo_stream.replace('terraform_output', partial: 'error_output')
          end
          end
    end
  

def execute_terraform_azure_instance1
  # define o caminho para o arquivo .tf que você deseja executar
  file_path = "/Users/robertooliveira/Desktop/Projeto_mestrado/arquivos_terraform/Azure/azure_instance1.zip"

  Dir.chdir("/Users/robertooliveira/Desktop/Projeto_mestrado/arquivos_terraform/Azure")
  system("terraform init")       
  system("terraform plan -out=planfile")   
  # define o comando Terraform a ser executado
  #terraform_command = "terraform init && terraform plan"

  #terraform_command = "terraform init && terraform plan && terraform apply #{file_path} "
  
  #terraform_command = "terraform apply #{file_path}"
  terraform_command = "terraform apply planfile"

  # executa o comando Terraform usando Open3
  Open3.popen3(terraform_command) do |stdin, stdout, stderr, wait_thr|
    exit_status = wait_thr.value.exitstatus
    if exit_status == 0
      # o comando foi executado com sucesso
      puts "Terraform apply executado com sucesso!"
      #render turbo_stream: turbo_stream.replace('terraform_output', partial: 'terraform_output')
      #render partial: 'pages/terraform_output'
      redirect_to azuresuccess_path
    else
      # houve um erro na execução do comando
      puts "Erro na execução do Terraform apply: #{stderr.read}"
      render turbo_stream: turbo_stream.replace('terraform_output', partial: 'error_output')
    end
    end
end

end