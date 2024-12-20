#!/bin/bash

# создание конфига для работы с кубером
create_kubeconfig_for_user() {
  local username=$1
  local kubeconfig_file="certificates/${username}-kubeconfig"

  # Generate the kubeconfig file for the user
  local server=$(kubectl config view -o jsonpath='{.clusters[?(@.name=="minikube")].cluster.server}')
  kubectl config set-cluster minikube-cluster --server=${server} --certificate-authority="$HOME/.minikube/ca.crt" --embed-certs=true --kubeconfig=$kubeconfig_file
  kubectl config set-credentials $username --client-certificate=certificates/${username}.crt --client-key=certificates/${username}.key --embed-certs=true --kubeconfig=$kubeconfig_file
  kubectl config set-context $username-context --cluster=minikube-cluster --namespace=default --user=$username --kubeconfig=$kubeconfig_file
  kubectl config use-context $username-context --kubeconfig=$kubeconfig_file
}

create_kubeconfig_for_user "client-ops"

# чтение подов - разрешено
echo "read pods access:"
kubectl auth can-i get pods --namespace client --kubeconfig=certificates/client-ops-kubeconfig

# создание подов - запрещено
echo "create pods access:"
kubectl auth can-i create pods --namespace client --kubeconfig=certificates/client-ops-kubeconfig
