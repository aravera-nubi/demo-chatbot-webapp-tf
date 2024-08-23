# # Configuración de CI/CD para una aplicación web en Azure mediante Terraform y GitHub Actions


## Introducción

En este proyecto, hemos desarrollado una aplicación basada en Python que será desplegada en Azure App Service, una plataforma en la nube gestionada que facilita la construcción, implementación y escalado de aplicaciones web. Nuestro enfoque de despliegue integra dos tecnologías clave para una gestión eficiente de la infraestructura y del flujo de trabajo de despliegue:

1. **Terraform**: Utilizamos Terraform, una herramienta de infraestructura como código (IaC), para definir y aprovisionar la infraestructura de Azure necesaria para nuestra aplicación. Esto permite que la creación y configuración de recursos en la nube, como App Service y Resource Groups, sean automatizadas y versionadas.

2. **GitHub Actions**: Empleamos GitHub Actions para implementar CI/CD (Integración Continua y Despliegue Continuo), asegurando un flujo de trabajo automatizado para construir, probar y desplegar la aplicación. Esto incluye dos workflows específicos:
   - **Workflow de Infraestructura**: Implementa y gestiona la infraestructura de Azure utilizando los scripts de Terraform. Este workflow se ejecuta cuando se realizan cambios en los archivos de configuración de Terraform, asegurando que cualquier ajuste en la infraestructura sea reflejado automáticamente en Azure.
   - **Workflow de Despliegue de Aplicación**: Se encarga de desplegar la aplicación en Azure App Service. Este flujo de trabajo se activa al hacer push de nuevos cambios en el código de la aplicación al repositorio, lo que facilita actualizaciones rápidas y eficientes.

## Requisitos previos

1. **Configurar el repositorio de GitHub**

   Crea un repositorio en GitHub que contenga el código de la aplicación.

2. **Crear un Service Principal para Terraform**

   Crea un service principal con acceso de Contribuidor a tu suscripción de Azure. Anota el `client_id`, `client_secret`, `subscription_id` y `tenant_id` del resultado del comando:

   ```bash
   az ad sp create-for-rbac --name "terraform-sp" --role contributor \
     --scopes /subscriptions/{subscription_id}

3. **Configurar secretos en GitHub**

   En tu repositorio de GitHub, ve a **Settings** -> **Secrets** y añade los siguientes secretos:

   - `AZURE_CLIENT_ID`: ID de cliente del Azure Service Principal
   - `AZURE_CLIENT_SECRET`: Secreto del Azure Service Principal
   - `AZURE_SUBSCRIPTION_ID`: ID de la suscripción de Azure
   - `AZURE_TENANT_ID`: ID del tenant de Azure AD     


## Configuración de Terraform