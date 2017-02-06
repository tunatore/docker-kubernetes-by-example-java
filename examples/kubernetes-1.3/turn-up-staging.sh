#!/bin/bash
###############################################################################
# Copyright 2015 Google Inc. All rights reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
###############################################################################

kubectl create namespace staging
kubectl --namespace=staging apply -f storage-gcp-standard.yaml --record
kubectl --namespace=staging apply -f mysql-pvc.yaml -f mysql-deployment.yaml -f mysql-service.yaml --record
kubectl --namespace=staging apply -f redis-deployment.yaml -f redis-service.yaml --record
kubectl --namespace=staging apply -f guestbookservice-deployment.yaml -f guestbookservice-service.yaml --record
kubectl --namespace=staging apply -f helloworldservice-deployment-v1.yaml -f helloworldservice-service.yaml --record
kubectl --namespace=staging apply -f helloworldui-deployment-v1.yaml -f helloworldui-service.yaml --record
