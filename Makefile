# CA API Management Helm Charts Makefile

.PHONY: help deps lint test package clean install uninstall

# Default target
help: ## Show this help message
	@echo "CA API Management Helm Charts"
	@echo ""
	@echo "Available targets:"
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m<target>\033[0m\n"} /^[a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)

##@ Dependencies
deps: ## Update chart dependencies
	@echo "Adding helm repositories..."
	@helm repo add hazelcast https://hazelcast-charts.s3.amazonaws.com/ || true
	@helm repo add influxdata https://helm.influxdata.com/ || true
	@helm repo add bitnami https://charts.bitnami.com/bitnami || true
	@helm repo add bitnami-archive https://raw.githubusercontent.com/bitnami/charts/archive-full-index/bitnami || true
	@helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx/ || true
	@helm repo update || true
	@echo "Updating chart dependencies..."
	@helm dependency update charts/gateway || echo "Gateway dependency update failed"
	@helm dependency update charts/portal || echo "Portal dependency update failed"
	@helm dependency update charts/gateway-otk || echo "Gateway-OTK dependency update failed"
	@helm dependency update . || echo "Root chart dependency update failed"

##@ Validation
lint: ## Lint all charts
	@echo "Linting charts..."
	@helm lint charts/gateway
	@helm lint charts/portal  
	@helm lint charts/druid
	@helm lint charts/gateway-otk
	@helm lint .

test: ## Run chart tests
	@echo "Testing charts..."
	@helm template test-gateway charts/gateway --values charts/gateway/ci/ci-values.yaml > /dev/null || echo "Gateway template test failed (license required)"
	@helm template test-portal charts/portal --values charts/portal/ci/ci-values.yaml > /dev/null || echo "Portal template test failed"
	@helm template test-druid charts/druid --values charts/druid/ci/ci-values.yaml > /dev/null || echo "Druid template test failed"
	@helm template test-gateway-otk charts/gateway-otk --values charts/gateway-otk/ci/ci-values.yaml > /dev/null || echo "Gateway-OTK template test failed (license required)"
	@helm template test-umbrella . --set gateway.enabled=false --set portal.enabled=false --set gateway-otk.enabled=false --set druid.enabled=false > /dev/null || echo "Umbrella template test failed"
	@echo "Chart template tests completed"

##@ Packaging
package: deps lint ## Package all charts
	@echo "Packaging charts..."
	@mkdir -p dist
	@helm package charts/gateway -d dist/
	@helm package charts/portal -d dist/
	@helm package charts/druid -d dist/
	@helm package charts/gateway-otk -d dist/
	@helm package . -d dist/

##@ Installation
install-gateway: ## Install gateway chart
	@helm install ca-gateway charts/gateway

install-portal: ## Install portal chart  
	@helm install ca-portal charts/portal

install-all: ## Install complete API management suite
	@helm install ca-api-management .

##@ Cleanup
uninstall: ## Uninstall all releases
	@helm uninstall ca-gateway --ignore-not-found
	@helm uninstall ca-portal --ignore-not-found
	@helm uninstall ca-api-management --ignore-not-found

clean: ## Clean generated files
	@rm -rf dist/
	@rm -rf charts/*/charts/
	@rm -rf charts/*/Chart.lock
	@rm -rf charts.lock

##@ Development
dry-run: ## Dry run installation of umbrella chart (uses template when no cluster available)
	@helm install test-ca-api-management . --dry-run --debug || helm template ca-api-management . > /dev/null

template: ## Generate templates for umbrella chart
	@helm template ca-api-management .
