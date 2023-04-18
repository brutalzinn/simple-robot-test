from concurrent.futures.thread import ThreadPoolExecutor
from websockets.sync.client import connect

class Finder:
    def __init__(self, gateway ,port):
        self.found = False
        self.address = "0.0.0.0"
        self.gateway = gateway
        self.port = port

    def waitAddress(self):
        with ThreadPoolExecutor() as executor:
            for host in range(1, 255):
                executor.submit(self.__find, host)
                if self.found:
                    break
            return self.address
    
    def __find(self, host):
            try:
                self.address = f"ws://{self.gateway}{host}:{self.port}"
                with connect(self.address, open_timeout=0.5, close_timeout=0.1) as websocket: 
                    websocket.send("1")
                    print(f"esp 01 as found in {self.address}")
                    self.found = True
                    websocket.close()
            except:
                self.found = False
                pass    