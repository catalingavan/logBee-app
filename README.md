# [![Logbee](https://github.com/logBee-net/logBee-app/assets/39127098/d1436229-983d-41e7-bcff-7288601bf2d0)](https://logbee.net)

Logbee is a logging aggregator, exceptions tracking and Application Performance Monitoring server. <br/>
It provides an intuitive user-interface, allowing developers to access the information and other useful metrics in real-time.

The application can be used [online](https://logbee.net) or it can be installed locally.

## Technology

- Built on .NET8
- It can be hosted on Windows or Linux, or run as a [Docker container](Docker/README.md)
- Configurable storage using MongoDB 6.0 or Azure Cosmos DB (more storage options are under development)

## Artifacts

Logbee artifacts can be downloaded from here: <br/>
<https://github.com/logBee-net/logBee-app/releases>

Installation and configuration guide can be found here: <br/>
[https://logBee.net/Docs/on-premises.index.html](https://logBee.net/Docs/on-premises.index.html)

### Latest versions

[logBee.Frontend-v1.1.6](https://github.com/logBee-net/logBee-app/releases/tag/logBee.Frontend-v1.1.6)

[logBee.Backend-v1.1.0](https://github.com/logBee-net/logBee-app/releases/tag/logBee.Backend-v1.1.0)

```none
docker pull catalingavan/logbee.frontend:1.1.6
docker pull catalingavan/logbee.backend:1.1.0
```

## Integrations

Examples of integration applications can be found on the [logbee-integrations-examples](https://github.com/catalingavan/logbee-integrations-examples) repository.

- Serilog (.NET)
- KissLog (.NET)
- ExpressJS (Node.js)
- OpenTelemetry
- REST (using Logbee APIs)

## User interface

Here is a snapshot of the Logbee dashboard, showing how logs are displayed in real-time:

<table><tr><td>
    <img alt="User interface" src="https://github.com/logBee-net/logBee-app/assets/39127098/44c8686b-bc24-4c4e-9fd8-155da9826a08" />
</td></tr></table>
