import keyboard
import websocket
from models.directions import Directions
from models.motion import Motion
from models.finder import Finder
# global vars
gateway = "192.168.0.1"
port = 5000
queue = []
ws: websocket = None

def handle_key_event(event):
    if event.name == 'w':
        forward()
    elif event.name == 'a':
        left()
    elif event.name == 'd':
        right()
    elif event.name == 's':
        reverse()
    send_package()

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

def send_package():
    move = queue[0]
    print(move.to_json())
    ws.send(move.to_json())
    queue.clear()

if __name__ == "__main__":
    finder = Finder(gateway, port)
    ipAddress = finder.waitAddress()
    url = "ws://{}:{}".format(ipAddress, port)
    ws = websocket.create_connection(url)
    keyboard.on_press(handle_key_event, ws)
    keyboard.wait('esc')
