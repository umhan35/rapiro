require "wiringpi"

class Rapiro

  SERIAL_COMMANDS = {"stop"=>"#M0", "move_forward"=>"#M1", "move_back"=>"#M2", "turn_right"=>"#M3", "turn_left"=>"#M4", "wave_both_hands"=>"#M5", "wave_right_hands"=>"#M6", "grip_both_hands"=>"#M7", "wave_left_hand"=>"#M8", "stretch_out_right_hand"=>"#M9"}

  def initialize
    @serial_port = WiringPi::Serial.new("/dev/ttyAMA0", 57600)
  end

  def method_missing method_sym, *arguments, &block
    @serial_port.serialPuts(SERIAL_COMMANDS[method_sym.to_s])
  end

  def die
    @serial_port.serialClose
  end
end
