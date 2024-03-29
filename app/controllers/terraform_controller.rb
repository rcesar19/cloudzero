class TerraformController < ApplicationController  
           
    require 'open3'

    def execute_terraform_aws_instance1
      # define o caminho para o arquivo .tf que você deseja executar
      file_path = "/Users/robertooliveira/Desktop/Projeto_mestrado/arquivos_terraform/aws_instance1.tf"
    
      # define o comando Terraform a ser executado
      terraform_command = "terraform apply #{file_path}"
    
      # executa o comando Terraform usando Open3
      Open3.popen3(terraform_command) do |stdin, stdout, stderr, wait_thr|
        exit_status = wait_thr.value.exitstatus
        if exit_status == 0
          # o comando foi executado com sucesso
          puts "Terraform apply executado com sucesso! from terraform controller"
        else
          # houve um erro na execução do comando
          puts "Erro na execução do Terraform apply: #{stderr.read}"
        end
      end
    end

    def execute_terraform_aws_instance1
      # define o caminho para o arquivo .tf que você deseja executar
      file_path = "/Users/robertooliveira/Desktop/Projeto_mestrado/arquivos_terraform/azure_instance1.tf"
    
      # define o comando Terraform a ser executado
      terraform_command = "terraform apply #{file_path}"
    
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
  