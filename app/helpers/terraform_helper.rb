module TerraformHelper
    def get_terraform_output
        output = `terraform output public_ip`
        output.strip.split("\n")
    end
end
