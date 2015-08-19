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
    ip = node[ ip[1..-1] ] if ip[0] == ':'

    hostsfile_entry ip do
      ali=[]
      ( (v['aliases'].is_a? Array) ? v['aliases'] : Array[v['aliases']] ).each do |i|
        if i[0] == ':'
             ali << node[ i[1..-1] ]
        else ali << i
        end
      end if v['aliases']

      hostname v['domain'][0] == ':' ? node[ v['domain'][1..-1] ] : v['domain'] if defined? v['domain'] && v['domain'] != ''
      aliases  ali if ali.any?
      action   v['action'] ? v['action'] : 'create'
    end

  end
end if defined? node['chef-hostsfile'] && node['chef-hostsfile'] != ''

