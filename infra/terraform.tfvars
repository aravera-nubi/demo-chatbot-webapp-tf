createdby            = "Araceli Vera"
deadline             = "2024-8-20"
owner                = "Araceli Vera"
pod                  = "2"
project              = "arawebapp"
location             = "eastus"
coe                  = "1"
environment          = "lab"
sku_name             = "B1"
service_name         = "chatbot"
python_version       = "3.9"
app_command_line     = "gunicorn --preload --bind 0.0.0.0:8000 --workers=4 --timeout 600 app:app"
app_settings         = {}