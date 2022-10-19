#
# Copyright (c) 2022 Intel Corporation
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

#!/bin/bash
set -e

#below is fake secret, you need to replace with your valid ones
ccp-cli pack --app-entry="/clf/cczoo/cross_lang_framework/clf_server/clf_server" \
             --memsize=8192M --thread=64 \
             --tmpl=default \
             --secret-id=AKID3vXswkIAl59vQebIjskMhlY8KJ1RbU6S \
             --secret-key=6vTklUw83i6C1Zrra3GBpCI8gy9NTIr9 \
             --capp-id=capp-Y2IyNGM1YzAt \
             --app-image=clf-server:gramine1.3-ubuntu20.04 \
             --app-type=image \
             --start=/clf/cczoo/cross_lang_framework/clf_server

# just an example about how to run
docker run -it -p 4433:4433 --device /dev/sgx_enclave --device /dev/sgx_provision -v /home/ubuntu/liang/confidential-computing-zoo/cczoo/cross_lang_framework/clf_server/certs:/clf/cczoo/cross_lang_framework/clf_server/certs -v /home/ubuntu/liang/confidential-computing-zoo/cczoo/cross_lang_framework/clf_server/clf_server.conf:/clf/cczoo/cross_lang_framework/clf_server/clf_server.conf --add-host=VM-0-3-ubuntu:10.206.0.3 sec_clf-server:gramine1.3-ubuntu20.04

