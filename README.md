# Eeensy Weensy ETL

This is getting to know Azure - a database, a serverless function, some Terraform, and (if things go well) some Java microservice API endpoints. In AWS this is very straight-forward for me because that is 100% my infrastructure experience. I'm seeing more and more companies requiring Azure experience so, this way, at least I can say I've touched it.


## 2025-06-11 21:42:14
Did some research on Github Events API and created a Github auth token. Added the bones of Terraform code for a Azure serverless Java function.


## 2025-06-11 20:23:22
Finished the Terraform for the database and applied this. I have a SQL database in Azure!


## 2025-06-13 14:58:08
the way to link up a function with it's code?
> a Function App Function can be imported using the resource id, e.g.
`terraform import azurerm_function_app_function.example "/subscriptions/12345678-1234-9876-4563-123456789012/resourceGroups/resGroup1/providers/Microsoft.Web/sites/site1/functions/function1"`

