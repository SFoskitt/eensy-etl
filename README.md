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


## 2025-06-14 15:08:20

# HOLD ON TO THIS - I don't know what this is for
# resource "azurerm_storage_account" "eensyStorage" {
#   name = "eensystorage"
#   resource_group_name = "Eensy"
#   location = "eastus"
#   account_tier = "Standard"
#   account_replication_type = "LRS"
# }


## 2025-06-14 15:54:19

Previous search results say the timer needs to be added as an annotation in Java. Possibly that search did not contain the term "terraform".
New search is "terraform azure how to trigger function automatically with timer" and Google AI says I can add this to the function_app_function resource in a config block.

# ADD THIS TO function_app_function block when you get there
# https://www.google.com/search?q=terraform+azure+how+to+trigger+function+automatically+with+timer&sca_esv=d22a87f29702b322&source=hp&ei=wsxNaL2UBrzmwN4Po5rAiAg&iflsig=AOw8s4IAAAAAaE3a0h_pEGznpi-YLLpknibyZhHta1MM&ved=0ahUKEwi9_fKM0vGNAxU8M9AFHSMNEIEQ4dUDCA8&uact=5&oq=terraform+azure+how+to+trigger+function+automatically+with+timer&gs_lp=Egdnd3Mtd2l6IkB0ZXJyYWZvcm0gYXp1cmUgaG93IHRvIHRyaWdnZXIgZnVuY3Rpb24gYXV0b21hdGljYWxseSB3aXRoIHRpbWVySIMDUABYAHAAeACQAQCYAZEBoAGRAaoBAzAuMbgBA8gBAPgBAvgBAZgCAKACAJgDAJIHAKAHdLIHALgHAMIHAMgHAA&sclient=gws-wiz
# config_json = jsonencode({
#   "bindings" = [
#     {
#       "type": "timerTrigger",
#       "name": "mytimer",    # Name used in your function code to represent the timer object
#       "direction": "in",
#       "schedule": "0 */5 * * * *"  # CRON expression for every 5 minutes
#     }
#   ]
# })

