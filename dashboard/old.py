import time
import keyboard
import serial

ser=serial.Serial("COM3",9600)

def handle_key_event(event):
    if event.name == 'w':
        forward()
    elif event.name == 'a':
        left()
    elif event.name == 'd':
        right()
    elif event.name == 's':
        reverse()


def forward():
    print("forward")
    ser.write((b'w'))

def left():
    print("left")
    ser.write(b'a')

def right():
    print("right")
    ser.write(b'd')


def reverse():
    print("reverse")
    ser.write(b's')

def forceStop():
    print("force stop")
    ser.write(b'f')


keyboard.on_press(handle_key_event)

keyboard.wait('esc')
forceStop()
ser.close()