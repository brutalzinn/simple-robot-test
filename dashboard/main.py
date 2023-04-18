import threading
import keyboard
from websockets.sync.client import connect
from models.finder import Finder
# global vars
gateway = "192.168.0."
address = "0.0.0.0"
port = 5000
 
def handle_key_event(event):
   
    print("controle") 
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

def left():
    print("left")

def right():
    print("right")

def reverse():
    print("reverse")

def forceStop():
    print("force stop")



if __name__ == "__main__":
    t = Finder(gateway, port)
    print("Trying to hand shake to esp 01 module")
    address = t.waitAddress()
    print(address)
    # with connect(address) as websocket:
    #     websocket.send()
    # keyboard.on_press(handle_key_event)
    # keyboard.wait('esc')
    # forceStop()
    # ws.close()
