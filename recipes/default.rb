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
    case ip
      when "0.0.0.0"
        ip = node['ipaddress']
    end

    hostsfile_entry ip do
      if v['domain'][0] == ':'
           hostname node[ v['domain'][1..-1] ]
      else hostname v['domain']
      end if v['domain']

      al=[]; v['aliases'].each do |i|
        if i[0] == ':'
             al << node[ i[1..-1] ]
        else al << i
        end
      end if v['aliases']
      aliases al if al.any?

      action (v['action']? v['action']: 'create')
    end
  end
end if defined? node['chef-hostsfile'] && (node['chef-hostsfile'].is_a? Array)
