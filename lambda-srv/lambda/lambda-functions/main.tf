resource "aws_lambda_function" "this" {
  #count = local.create && var.create_function && !var.create_layer ? 1 : 0

  function_name                      = var.function_name
  description                        = var.description
  role                               = var.create_role 
  #handler                            = var.package_type != "Zip" ? null : var.handler
  runtime                            =  var.runtime
  architectures                      = "x86_64var"

  tags =  {
    env: var.env
 }

}

 