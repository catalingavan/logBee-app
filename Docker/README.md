# Logbee on Docker

Logbee can run as a Docker container, thanks to [Marcio](https://github.com/zimbres) valuable contribution.

In this folder you will find all the necessary files.

```none
# starts the Logbee app and all the necesarry prerequisites
C:\logbee-net\logbee-app\Docker> docker-compose up

# stops the Logbee app docker containers
C:\logbee-net\logbee-app\Docker> docker-compose down

# Authentication token,
# a JWT signed with the value from frontend.logbee.json@$.Authorization.HS256Secret
eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.e30.HP79qro7bvfH7BneUy5jB9Owc_5D2UavFDulRETAl9E

# logbee.Frontend endpoint
http://localhost:44080/

# logbee.Backend endpoint
http://localhost:44088/
```

```csharp
// start sending the logs to the local logbee.Backend endpoint
app.UseKissLogMiddleware(options => {
    options.Listeners.Add(new RequestLogsApiListener(new Application("_OrganizationId_", "_ApplicationId_"))
    {
        ApiUrl = "http://localhost:44088/" // logbee.Backend endpoint
    });
});
```

![Logbee login](https://github.com/catalingavan/logbee-app/assets/39127098/43d80638-bf38-4e2f-9b7c-8aef0c1ce4ed)

![Running docker-compose](https://github.com/catalingavan/logbee-app/assets/39127098/895ae32f-f546-4004-a66e-ed64027250b4)