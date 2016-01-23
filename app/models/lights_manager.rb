class LightsManager
  TRIGGER = File.join '', 'tmp', 'lamptrigger'
  STATUS_OID = '1.3.6.1.4.1.19865.2.3.1.15.6.0'
  LIGHTS_CONTROLLER_IP = '192.168.232.4'

  def self.status
    case snmp_status
    when 1
      :on
    when 0
      :off
    else
      :unknown
    end
  end

  def self.toggle_force_on
    if File.exist? TRIGGER
      File.delete TRIGGER
    else
      File.open TRIGGER, 'w' do |file|
        file.write '{P}~~~ kroci'
      end
    end
  end

  def self.snmp_status
    SNMP::Manager.open host: LIGHTS_CONTROLLER_IP do |manager|
      manager.get_value STATUS_OID
    end
  end

  private_class_method :snmp_status
end
