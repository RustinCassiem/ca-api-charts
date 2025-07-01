# Contributing to CA API Management Helm Charts

Thank you for your interest in contributing to the CA API Management Helm Charts repository!

## Development Setup

### Prerequisites
- Kubernetes cluster (minikube, kind, or cloud provider)
- Helm 3.2.0+
- kubectl configured to access your cluster
- make (optional, for convenience)

### Getting Started

1. Fork and clone the repository:
```bash
git clone https://github.com/your-username/ca-api-charts.git
cd ca-api-charts
```

2. Update chart dependencies:
```bash
make deps
# or manually:
helm dependency update charts/gateway
helm dependency update charts/portal
```

3. Validate your changes:
```bash
make lint test
```

## Chart Development Guidelines

### Chart Structure
Each chart should follow the standard Helm chart structure:
```
chart-name/
├── Chart.yaml          # Chart metadata
├── values.yaml         # Default configuration values
├── README.md          # Chart documentation
├── templates/         # Kubernetes manifests
│   ├── deployment.yaml
│   ├── service.yaml
│   └── ...
├── charts/           # Chart dependencies (auto-generated)
└── ci/              # CI-specific values
    └── ci-values.yaml
```

### Versioning
- Follow [Semantic Versioning](https://semver.org/)
- Bump chart version for any changes
- Update appVersion when changing application version

### Values Files
- Use camelCase for value names
- Provide sensible defaults
- Document all values in comments
- Group related values logically

### Templates
- Use meaningful resource names
- Include proper labels and annotations
- Follow Kubernetes best practices
- Test with different value combinations

## Testing

### Local Testing
```bash
# Lint charts
helm lint charts/gateway

# Dry run
helm install test-gateway charts/gateway --dry-run --debug

# Template generation
helm template test-gateway charts/gateway

# Install locally
helm install test-gateway charts/gateway
```

### Automated Testing
The repository includes GitHub Actions workflows that:
- Lint charts on pull requests
- Test chart installation on kind clusters
- Package and release charts on merge to main

## Submitting Changes

### Pull Request Process
1. Create a feature branch from main
2. Make your changes
3. Update chart versions if needed
4. Update documentation
5. Test your changes locally
6. Submit a pull request

### Pull Request Checklist
- [ ] Chart version bumped (if needed)
- [ ] Documentation updated
- [ ] Changes tested locally
- [ ] CI checks pass
- [ ] No breaking changes (or clearly documented)

### Commit Message Format
Use conventional commits format:
```
type(scope): description

feat(gateway): add support for custom annotations
fix(portal): resolve database connection issue
docs(readme): update installation instructions
```

## Documentation

### README Files
Each chart should have a comprehensive README.md including:
- Chart description
- Prerequisites
- Installation instructions
- Configuration options
- Examples
- Upgrading information

### Values Documentation
Document all configuration options in values.yaml with comments:
```yaml
# Database configuration
database:
  # Whether to create a database
  create: true
  # Database type (mysql, postgresql)
  type: mysql
```

## Code Review

All submissions require review. We use GitHub pull requests for this purpose.

### Review Criteria
- Code quality and best practices
- Documentation completeness
- Test coverage
- Breaking change impact
- Security considerations

## Community

- Join discussions in GitHub Issues
- Ask questions in pull request comments
- Follow the project for updates

## License

By contributing, you agree that your contributions will be licensed under the same license as the project.
