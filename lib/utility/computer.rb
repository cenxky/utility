require 'socket'
require 'macaddr'
require 'rubygems'

module Utility::Computer
  def get_ip
    ip = Socket.ip_address_list.detect do |intf|
      intf.ipv4? &&
      !intf.ipv4_loopback? &&
      !intf.ipv4_multicast?
    end
    ip.nil?? "IP address not found" : ip.ip_address
  end

  def get_mac
    Mac.addr.list rescue Mac.address
  end

  def get_hostname
    Socket.gethostname
  end

  def get_os
    Gem::Platform.local.os
  end

  def get_arch
    1226.size * 8
  end
end
