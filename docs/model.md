### Concepts

 - Scenario is a set of rules that will be executed to obtain a data set 
 - Platform API is the programming interface used by repository provider
 - Materialized scenario is an exact query that will be executed against platform API
 - Run is a single execution of one or multiple materialized scenarios in short time period
 - Call is a single API invocation
 - Application version is the checksum of the application binary
 - Configuration version is the checksum of all config files
 - Repository information is the acquired data
 
### Dependencies

Primary concepts are identified by unique identifiers, checksums and names

 - Scenario is a primary concept
 - Platform API is a primary concept
 - Application version is a primary concept
 - Configuration version is a primary concept
 - Materialized scenario is related to specific scenario, platform API, application and configuration versions
 - Run is related to a set of calls
 - Call has a timestamp and reference to a materialized scenario
 - Repository is related to a specific call
 