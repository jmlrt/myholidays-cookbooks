name "prod"
description "The production environment"
default_attributes "nginx" => { "server_name" => "www.myholidays.fr" }
