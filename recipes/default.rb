#
# Cookbook Name:: chef-hostsfile
# Recipe:: default
#
# Copyright (C) 2014 PE, pf.
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#
node['chef-hostsfile'].each do |e|
  e.each do |ip, v|
    hostsfile_entry ip do
      hostname v['domain'] if v['domain']
      aliases v['aliases'] if v['aliases']
      action (v['action']? v['action']: 'create')
    end
  end
end if node['chef-hostsfile'] && (node['chef-hostsfile'].is_a? Array)
