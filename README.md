# Managed Application Runtime - Play Framework 2.3 Full Deployment Example

This is an example of full Play Framework server deployment with Activator generated sample application for Qt Cloud Services - Managed Application Runtime ("**MAR**"). More information about [Play Framework](https://www.playframework.com/).

## Getting Started

See the Managed Application Runtime getting started documentation at Qt Cloud Services [Developer Documentation ](https://developer.qtcloudservices.com/mar/getting-started)

## Some Notes About the Files in This Example

### .buildpacks

This project demonstrates also using a composable multi-buildpack feature using [Heroku buildpack for Scala](https://github.com/heroku/heroku-buildpack-scala). After creating MAR instance the respective environmental variable must be set in MAR container for enabling the multi-buildpack support. Take a look on notes in chapter "Deploying to Cloud".

### Procfile

Procfile instructs the web process type to run the java.sh file which containts the detailed information how to startup the application.

### java.sh

Upon deployment Qt Cloud Services MAR container provides an environmental variable **$PORT** for which the HTTPS requests hitting Qt Cloud Services load balancer SSL port are internally forwarded into. 

The **$PORT** value is delivered to the Play Framework process by this script file when executed by a web process in MAR container.

### system.properties

This file contains only the dependency information about Play Framework version to be used (Play Framework 2.3).

## Running and Testing Application Locally

You can start this application from the application root directory with the following commands depending your operating system:

### *nix
```
./activator run
```

### Windows
```
activator.bat run
```

Once the server has been started, you may test the sample application with your web browser at address http://127.0.0.1:9000 which should respond with "Your new application is ready!" decorated with Play Framework welcome page which is shown only when running locally in development mode.

## Deploying to Cloud

Please see the Qt Cloud Services [Developer Documentation ](https://developer.qtcloudservices.com/mar/getting-started)

**NOTE**: This example requires multi-buildpack support to be instructed for MAR container before deploying the sample into it. Using [qtc-cli client command-line tool](https://developer.qtcloudservices.com/qtc/cli) run the following command into MAR in question:
 ```
 qtc-cli mar envs:set BUILDPACK_URL=https://github.com/ddollar/heroku-buildpack-multi
 ```

**NOTE**: Without tweaking any command-line Java arguments regarding the heap memory usage deploy the sample app only to the instance which fulfills the following Runtime Size: **ar-1-small (2CU, 512MB)** 

Once having the application deployed and running in the cloud, you may test the sample application with your web browser at address https://<your-app-ID>.qtcloudapp.com/hello-world-webapp which should respond with a bare string "Your new application is ready.".