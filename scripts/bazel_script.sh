#!/usr/bin/env bash
# Copyright 2023 Harness Inc. All rights reserved.
# Use of this source code is governed by the PolyForm Free Trial 1.0.0 license
# that can be found in the licenses directory at the root of this repository, also available at
# https://polyformproject.org/wp-content/uploads/2020/05/PolyForm-Free-Trial-1.0.0.txt.

set -ex

BAZEL_ARGUMENTS="--show_timestamps --announce_rc --sandbox_debug --verbose_failures"

BAZEL_DIRS=${HOME}/.bazel-dirs
BAZEL_ARGUMENTS="${BAZEL_ARGUMENTS} --experimental_convenience_symlinks=normal --symlink_prefix=${BAZEL_DIRS}/"

build_bazel_module() {
  bazel version
  module=$1
  BAZEL_MODULE="//${module}:pkg_dashboards"

  bazel ${bazelrc} build $BAZEL_MODULE
  tar -xf bazel-bin/${module}/pkg_dashboards.tar
}

# Building per module may not be needed currently as each module just has file groups for now.
# Having this in place if more bazel targets are added in the modules.
build_bazel_module CCM
build_bazel_module CD-CORE
build_bazel_module CIE
build_bazel_module Chaos
build_bazel_module Cloud_Monitoring_SaaS_Only
build_bazel_module Cluster_Pod_Details_SaaS_Only
build_bazel_module Database
build_bazel_module Feature_Flags
build_bazel_module CD-OPA-GitOps-CV
build_bazel_module IAC
build_bazel_module Monitoring_System
build_bazel_module Platform
build_bazel_module SCM
build_bazel_module STO
build_bazel_module System_Health
build_bazel_module System_Usability
build_bazel_module Continuous_ET
build_bazel_module CD-Pipeline
build_bazel_module Weaviate
build_bazel_module SRM
