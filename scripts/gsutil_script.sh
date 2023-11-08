#!/usr/bin/env bash
# Copyright 2023 Harness Inc. All rights reserved.
# Use of this source code is governed by the PolyForm Free Trial 1.0.0 license
# that can be found in the licenses directory at the root of this repository, also available at
# https://polyformproject.org/wp-content/uploads/2020/05/PolyForm-Free-Trial-1.0.0.txt.
# Script to run gsutils

set -ex

gsutil_cp_module() {
  module=$1

  dir=harness-dashboards/${module}
  if [ -d "$dir" ]; then
    gsutil cp ${dir}/* gs://monitoring-prod-dashboards/dashboards/${module}
  fi 
}

# Building per module may not be needed currently as each module just has file groups for now.
# Having this in place if more bazel targets are added in the modules.
gsutil_cp_module CCM
gsutil_cp_module CD
gsutil_cp_module CIE
gsutil_cp_module Chaos
gsutil_cp_module Cloud_Monitoring_SaaS_Only
gsutil_cp_module Cluster_Pod_Details_SaaS_Only
gsutil_cp_module Database
gsutil_cp_module Feature_Flags
gsutil_cp_module Gitops
gsutil_cp_module IAC
gsutil_cp_module Monitoring_System
gsutil_cp_module Platform
gsutil_cp_module SCM
gsutil_cp_module STO
gsutil_cp_module System_Health
gsutil_cp_module System_Usability 
gsutil_cp_module Continuous_ET
gsutil_cp_module Pipeline_Service
gsutil_cp_module Weaviate
gsutil_cp_module SRM
