# harness-dashboards

Repo for all the Harness Grafana dashboards

## CD Dashboards

| Dashboard | File | Tags | Description | Key Metrics |
|-----------|------|------|-------------|-------------|
| Custom Metrics: Iterators | `CD_Custom_Metrics_Iterators.json` | cd, ng-manager, cg-manager, pipeline, iterators | Monitors iterator performance metrics including entity processing rate, delays, and processing times across different environments and iterator types | Working on Entity Rate, Iterator Delay, Iterator Processing Time |
| CDC K8s Overview | `CD_K8s_Overview.json` | - | Kubernetes infrastructure monitoring for Change Data Capture service including CPU, memory, uptime, restarts, sync stats, and error rates | Hardware Usage (CPU/Memory), CDC Event Count, Container Uptime, Pod Restarts, Error Rate |
| CVNG - HTTP Resources | `CVNG_HTTP_Resources.json` | cd, cvng, http | HTTP endpoint monitoring for Continuous Verification Next Gen service tracking error rates, latencies, and incoming API traffic | Error Rate (%), Error Rate (req/s), P95 Latency, Incoming APIs |
| CVNG Service Metrics | `CVNG_Service_Metrics.json` | CVNG, SRM | Service-level metrics for CVNG monitoring request rates, latencies, and HTTP error percentages across different time windows | Requests (GET/POST/PUT/DELETE), Latency (P95/P99/Avg), HTTP Error % |
| JVM Observability | `JVM_Observability.json` | cd, jvm | Comprehensive JVM monitoring including memory pools (heap/non-heap/metaspace), thread states, and Dropwizard thread pool utilization | JVM Memory (Total/Heap/Non-Heap), Thread Counts, Thread States, DW Thread Utilization |
| Log-Service - Stream/Blob V2 | `Log-Service_Stream_Blob.json` | cd, log-service | Log service performance monitoring for stream and blob operations including write rates and latencies | Stream Write Rate, Stream Write Latency |
| NG-Manager - HTTP Resources | `NG-Manager_HTTP_Resources.json` | cd, ng-manager, http | HTTP resource monitoring for Next-Gen Manager tracking slowest APIs, error rates, and latencies by resource and status code | Top Slowest APIs, Error Rate (%), P95 Latency, Incoming APIs |
| Outbox Metrics | `Outbox_Metrics.json` | cd, outbox, pipeline, template, ng-manager, cg-manager | Outbox pattern implementation monitoring tracking total entries and entries by event type | Total Outbox Entries, Outbox Entries by Event Type |
| Pipeline-Service - Execution Metrics | `Pipeline-Service_Executions.json` | cd, pipeline | Pipeline execution monitoring tracking running, failed, and approval-waiting pipeline executions across different statuses | Pipeline Executions by Status, Running Executions, Approval-Waiting Executions |
| Pipeline-Service - Execution Metrics per Account | `Pipeline-Service_Executions_per_Acc_ID.json` | cd, pipeline, perAccount | Account-specific pipeline execution monitoring for running pipelines and node executions | Total Running Pipeline Executions, Total Running Node Executions |
| Pipeline-Service - HTTP Resources | `Pipeline-Service_HTTP_Resources.json` | cd, pipeline, http | HTTP endpoint performance for Pipeline Service including slowest APIs, error rates, and latencies | Top Slowest APIs, Error Rate (%), P95 Latency, Incoming APIs |
| Pipeline-Service - Overview V2 | `Pipeline-Service_Overview_v2.json` | cd, pipeline | High-level pipeline service overview tracking running steps, execution rate changes, and environment-specific metrics | Total Running Steps, Change in Rate of Executions per 10 Minutes |
| Pipeline-Service - Threads Instrumentation | `Pipeline-Service_Threads_Instrumentation.json` | cd, pipeline | Thread pool instrumentation for Pipeline Service monitoring submitted/completed tasks and running thread counts | Submitted Tasks MeanRate, Completed Tasks MeanRate, Running Thread Counts |
| Policy-Mgmt - HTTP Resources | `Policy-Mgmt_HTTP_Resources.json` | cd, http, opa, policy-mgmt | Policy Management service HTTP monitoring for OPA endpoints including slowest APIs and error rates | Top Slowest APIs, Error Rate (%), P95 Latency |
| Queue-Service - Overview | `Queue_Service_Dashboard.json` | cd, queue | Queue service operations monitoring including enqueue/dequeue rates, acknowledgments, and success metrics by module | Total Enqueue/Dequeue Requests per Module, Ack/Queue/Dequeue Requests, Success Rate |
| Redis Streams | `Redis_Streams.json` | cd, pipeline, redis | Redis Streams monitoring for pipeline service tracking memory usage and stream lengths | Memory Usage, Stream Length |
| Step Execution Status | `Step_Execution_Statuses.json` | cd, steps | Step-level execution monitoring tracking overall status, failed steps, and expired steps | Overall Step Execution Status, Failed Steps, Expired Steps |
| Template-Service - HTTP Resources | `Template-Service_HTTP_Resources.json` | cd, template, http | Template Service HTTP endpoint monitoring for API performance, error rates, and latencies | Top Slowest APIs, Error Rate (%), P95 Latency |
| Triggers - HTTP Resources | `Triggers_HTTP_Resources.json` | cd, triggers, http | Triggers service HTTP monitoring including trigger activations, API performance, and error rates | Top Slowest APIs, Trigger Activations, Error Rate (%) |
| WebServer Observability | `WebServer_Observability.json` | cd, webserver | Web server performance monitoring tracking error percentages, response times, and HTTP error rates | Mean Error%, Mean Response Time (P95), HTTP Error % [5m] |

## PL (Platform) Dashboards

| Dashboard | File | Tags | Description | Key Metrics |
|-----------|------|------|-------------|-------------|
| Access Control Entity Metrics | `Access_Control_Entity_Metrics.json` | 0compatible | Access Control entity-level metrics monitoring Redis consumer groups, pending counts, and outbox processing times | Redis Consumer Group Behind from Stream, Consumer Group Pending Count, Outbox Entries Processing Time |
| Access Control HTTP Metrics | `Access_Control_Http_Metrics.json` | 0compatible | HTTP metrics for Access Control service tracking service load, request rates, and slowest APIs | Service Overview, All APIs Request Rate, Top Slowest APIs > 1s |
| All PVCs Overview | `All_PVCs_Overview.json` | - | Persistent Volume Claims monitoring with alerts for PVCs predicted to be full based on daily usage trends | Alerts, PVCs Full in 2 Days, PVCs Full in 5 Days |
| All Pods Overview | `All_Pods_Overview.json` | kubernetes, k8s, 0compatible | Kubernetes pod-level monitoring tracking uptime and health across all pods | Pod Uptime, Health Status |
| All Services SLIs | `All_SLIs.json` | sli, platform | Service Level Indicators across all platform services with error rate and latency targets | Error Rate SLI (Target: < 1%), P95 Latency SLI (Target: < 1s) |
| Cluster Health Monitoring | `Cluster-Health-Report.json` | 0compatible | Kubernetes cluster health monitoring tracking node resources and pod restarts | Node CPU Usage %, Node Memory Usage %, Pod Restarts |
| Delegate Agent Resource Calls | `Delegate_Agent_Resource_Calls.json` | 0compatible | Delegate agent API call monitoring tracking rates by status code and P95 response times | Rate by Status Code (%), API Calls Sum, API P95 ART |
| Delegate Tasks | `Delegate_tasks.json` | 0compatible | Delegate task lifecycle monitoring including creation, active tasks, and task types | Active Delegate Tasks, Delegate Task Creation, Delegate Task Creation by Type |
| Perpetual Tasks | `Perpetual_Tasks.json` | 0compatible | Perpetual task monitoring tracking total, assigned, and unassigned tasks | Perpetual Tasks Number, Assigned Tasks, Unassigned Tasks |
| PL SLIs | `Platform_0env_SLIs.json` | - | Platform Service Level Indicators for ng-manager error rates and API response times | Error Rate (ng-manager) All APIs, API Response Time (P95) |
| Platform Service HTTP Metrics | `Platform_Service_Http_Metrics.json` | - | Platform service HTTP monitoring for API load, slowest endpoints, and status code rates | All APIs Request Rate, Top Slowest APIs > 1s, Resource API Status Code Rate |
| ScopeInfo Resource HTTP | `ScopeInfo_Resource.json` | 0compatible | ScopeInfo resource-specific HTTP monitoring tracking status code rates and latencies (P95/P99) | ScopeInfoResource API Status Code Rate, API P95, API P99 |
| Delegates Summary | `delegates.json` | 0compatible | Delegate registration and health monitoring including registrations, failures, and restarts | Delegate Registration, Delegate Registration Failed, Delegate Restarted |
| Generic Infra Monitoring Dashboard | `generic-infra-metric-dashboard.json` | PL, CAE, Platform, weekly-monitoring | Generic infrastructure monitoring for containers including CPU, memory utilization, and running container counts | Container Memory Utilization, Container CPU Utilization, Running Containers |
| Iterator Metrics | `iterator-metrics.json` | 0compatible | Iterator framework metrics monitoring entity processing, delays, and processing times | Iterator Working on Entity, Iterator Delay, Iterator Processing Time |
| MongoDB Overview | `mongodb_overview.json` | MongoDB, Percona | MongoDB database monitoring including command operations, connections, and cursor metrics | Command Operations, Connections, Cursors |
| Outbox Metrics | `outbox-metrics.json` | - | Outbox pattern metrics tracking total entries, blocked entries, and entries by event type | Total Outbox Entries, Total Blocked Outbox Entries, Outbox Entries by Event Type |
| Postgres Overview | `postgres_overview.json` | postgres, timescaledb | PostgreSQL database monitoring including row operations, queries per second, and buffer metrics | Rows, QPS (Queries Per Second), Buffers |
| Redis Streams Monitor (New) | `redis-stream-monitor-new.json` | - | Redis Streams monitoring tracking memory usage and stream lengths across all streams or per stream selection | Redis Streams Memory Usage (All/Per Stream), Redis Streams Length |
| Redis Dashboard for Prometheus Redis Exporter 1.x | `redis_overview.json` | prometheus, redis | Redis database monitoring including uptime, client connections, and command throughput | Max Uptime, Clients, Total Commands/sec |
