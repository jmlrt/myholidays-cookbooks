# See https://docs.chef.io/config_rb_knife.html for more information on knife configuration options

current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
node_name                "jmlrt"
client_key               "#{current_dir}/jmlrt.pem"
validation_client_name   "jmlrt-myholidays-validator"
validation_key           "#{current_dir}/jmlrt-myholidays-validator.pem"
chef_server_url          "https://api.opscode.com/organizations/jmlrt-myholidays"
cookbook_path            ["#{current_dir}/../cookbooks"]
