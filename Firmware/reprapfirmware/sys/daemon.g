; /sys/daemon.g  v1.1
; Used to execute regular tasks, the firmware executes it and once the end of file is reached it waits. If the file is not found it waits and then looks for it again.

; Loop, to be able to turn on/off daemon.g
while global.RunDaemon
  ; stuff goes here         
  ; Refresh chamber lights status
  if state.gpOut[0].pwm = 0
    set global.chamber_leds = "off"
  elif state.gpOut[0].pwm = 1
    set global.chamber_leds = "on"
  ;Refresh stealthburner led status
  M98 P"/sys/lib/led/sb_leds.g"                                                ; Run Stealthburner Neopixel macro
  G4 S1                                                                        ; delay running again or next command for at least 1 second