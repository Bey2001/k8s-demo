#!/bin/bash

script_dir=$(dirname ${0})
script_name=$(basename ${0})
source ${script_dir}/../lib/logging.sh

###############################################################################
# Variables
###############################################################################
project_dir=${script_dir}/../../project
backend_dir=${project_dir}/backend
frontend_dir=${project_dir}/frontend
project_version=v1.0.0
project_name=kubernetes-todo-list

###############################################################################
# Operation
###############################################################################
log_info "Beginning containerization of the backend component of the application"
log_warn "Copying Dockerfile to the backend directory of the project"
cp ${script_dir}/backend/Dockerfile ${backend_dir}
log_info "Building Docker container image for backend component"
pushd ${backend_dir} &> /dev/null
docker build -t ${project_name}-backend:${project_version} .
popd &> /dev/null

log_info "Beginning containerization of the frontend component of the application"
log_warn "Copying Dockerfile to the backend directory of the project"
cp ${script_dir}/frontend/Dockerfile ${frontend_dir}
log_info "Building Docker container image for frontend component"
pushd ${frontend_dir} &> /dev/null
docker build -t ${project_name}-frontend:${project_version} .
popd &> /dev/null