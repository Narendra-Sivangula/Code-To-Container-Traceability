#!/bin/sh

set -e

ARGOCD_VERSION="v3.2.6"
ARGOCD_MANIFEST_URL="https://raw.githubusercontent.com/argoproj/argo-cd/${ARGOCD_VERSION}/manifests/install.yaml"

echo "🔹 ArgoCD version: ${ARGOCD_VERSION}"

echo "🔹 Creating argocd namespace (if not exists)..."
kubectl create namespace argocd || true

echo "🔹 Applying ArgoCD manifest..."
kubectl apply -n argocd -f "${ARGOCD_MANIFEST_URL}"

echo "✅ ArgoCD ${ARGOCD_VERSION} installation triggered"
echo "ℹ️  Check status using:"
echo "    kubectl get pods -n argocd"

