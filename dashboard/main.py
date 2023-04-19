import threading
import keyboard
from websockets.sync.client import connect
from models.directions import Directions
from models.motion import Motion
from models.finder import Finder
# global vars
gateway = "192.168.0."
port = 5000
queue = []
url = "ws://0.0.0.0"

def handle_key_event(event):
    if event.name == 'w':
        forward()
    elif event.name == 'a':
        left()
    elif event.name == 'd':
        right()
    elif event.name == 's':
        reverse()
    send_package(url)
  
def forward():
    print("forward")
    queue.append(Motion(Directions.FORWARD, 255))

def left():
    print("left")
    queue.append(Motion(Directions.LEFT, 255))


def right():
    print("right")
    queue.append(Motion(Directions.RIGHT, 255))

def reverse():
    print("reverse")
    queue.append(Motion(Directions.REVERSE, 255))

def forceStop():
    queue.clear()

def set_address(address: str):
    url = f"ws://{address}:{port}"
    print(f"connection url is {url}")

def send_package(url: str):
    with connect(url) as websocket:
        print(f"send package to {url}")
        move = queue[0]
        websocket.send(move.to_json())
        queue.clear()

if __name__ == "__main__":
    t = Finder(gateway, port)
    print("Trying to find esp 01 module in the network..")
    address = t.waitAddress()
    print("The cloak of invisibility didn't work.")
    print(f"esp was found at {address}")
    set_address(address)
    keyboard.on_press(handle_key_event)
    keyboard.wait('esc')
    forceStop()
