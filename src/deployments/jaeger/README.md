## Jaeger
Deploys a Grafana Tempo deployment which exposes a Jaeger UI.

### Example
```
./up.sh --deployments jaeger tyk-stack
```

### Support
|     Item     |       Status       |
|:------------:|:------------------:|
|  OpenShift   |     :warning:      |
|   CI Tests   |        :x:         |
| Postman Test | :white_check_mark: |
|     SSL      |        :x:         |

### Supported Service Types with `--expose` flag
|     Item      |       Status       |
|:-------------:|:------------------:|
| Port Forward  | :white_check_mark: |
|    Ingress    |        :x:         |
| Load Balancer |        :x:         |

|        Icon        |        Description        |
|:------------------:|:-------------------------:|
| :white_check_mark: |   Supported and tested    |
|     :warning:      |        Not tested         |
|        :x:         |       Not supported       |
|     :no_entry:     | Not supported by the tool |
