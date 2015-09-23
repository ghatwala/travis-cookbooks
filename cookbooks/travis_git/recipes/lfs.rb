# Cookbook Name:: travis_git
# Recipe:: lfs
#
# Copyright 2011-2015, Travis CI Development Team <contact@travis-ci.org>
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

bash 'install git-lfs' do
  cwd Chef::Config[:file_cache_path]

  code <<-EOF
    curl -sLo - https://github.com/github/git-lfs/releases/download/v#{node['travis_git']['lfs']['version']}/git-lfs-linux-amd64-#{node['travis_git']['lfs']['version']}.tar.gz | tar xzvf -
    cd git-lfs-*
    ./install.sh
  EOF

  action :run
end