#!/bin/bash


cluster_name=$1


kind create cluster --name ${cluster_name}
