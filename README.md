# CA API Management Helm Charts

This repository contains Helm charts for deploying CA API Management components on Kubernetes.

## Charts

### Core Components
- **gateway** - Layer7 Gateway deployment with optional dependencies (Hazelcast, InfluxDB, Grafana, MySQL, Redis)
- **gateway-otk** - Gateway with OAuth Toolkit (OTK) configuration
- **portal** - CA API Developer Portal with analytics support
- **druid** - Portal Analytics Chart for data processing and visualization

## Prerequisites

- Kubernetes 1.19+
- Helm 3.2.0+

## Installation

### Gateway
```bash
helm install my-gateway ./charts/gateway
```

### Portal
```bash
helm install my-portal ./charts/portal
```

### Gateway with OTK
```bash
helm install my-gateway-otk ./charts/gateway-otk
```

## Configuration

Each chart can be configured using values files. See individual chart READMEs for detailed configuration options:

- [Gateway Configuration](./charts/gateway/README.md)
- [Portal Configuration](./charts/portal/README.md)
- [Druid Configuration](./charts/druid/README.md)

## Development

### Fetching Dependencies
Use the provided scripts to fetch chart dependencies:

```bash
# Linux/macOS
./fetch-charts.sh

# Windows
fetch-charts.bat
```

### Testing Charts
```bash
# Validate chart syntax
helm lint ./charts/gateway

# Dry run installation
helm install test-gateway ./charts/gateway --dry-run --debug
```

## Contributing

1. Make changes to charts
2. Update chart versions in Chart.yaml
3. Update documentation
4. Test changes locally
5. Submit pull request

## License

See individual chart directories for licensing information.