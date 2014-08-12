require 'artoo'

connection :ardrone, :adaptor => :ardrone
device :drone, :driver => :ardrone, :connection => :ardrone

work do
  drone.start
  drone.take_off
  after(10.seconds) { drone.hover.land }
  after(15.seconds) { drone.stop }
end
