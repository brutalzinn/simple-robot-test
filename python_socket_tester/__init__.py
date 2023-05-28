from simple_websocket_server import WebSocketServer, WebSocket
import time, traceback
import threading

from python_socket_tester.models.battery import Battery

#https://gist.github.com/allanfreitas/e2cd0ff49bbf7ddf1d85a3962d577dbf
def every(delay, task):
  next_time = time.time() + delay
  while True:
    time.sleep(max(0, next_time - time.time()))
    try:
      task()
    except Exception:
      traceback.print_exc()
    next_time += (time.time() - next_time) // delay * delay + delay

class SimpleEcho(WebSocket):
    def __init__(self, server, sock, address):
       self.batteryIndicator = 7200
       super().__init__(server, sock, address)
    def handle(self):
        self.send_message(self.data)
    def batteryLevel(self):
       #7v is the max
       #4v is already charged but low level chargeded
       voltage = self.batteryIndicator / 1000
       self.batteryIndicator = self.batteryIndicator - 100
       print(voltage)
       if(self.batteryIndicator== 1000):
          self.batteryIndicator= 7200
       self.send_message(Battery(voltage).to_json())

    def connected(self):
        threading.Thread(target=lambda: every(0.5, self.batteryLevel)).start()
        print(self.address, 'connected')

    def handle_close(self):
        print(self.address, 'closed')


server = WebSocketServer('', 6666, SimpleEcho)
server.serve_forever()