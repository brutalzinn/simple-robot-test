from concurrent.futures.thread import ThreadPoolExecutor
import socket

class Finder:
    def __init__(self, gateway ,port):
        self.address = "0.0.0.0"
        self.gateway = gateway
        self.port = port

    def waitAddress(self):
        with ThreadPoolExecutor() as executor:
            for i in range(1, 255):
                self.address = f"{self.gateway}{i}"
                executor.submit(self.__find, self.address, self.port)
        return self.address
    
    def __find(self, host:str, port:str):
            """
            :param str host: host address
            :param str port: host address
            """
            s = socket.socket()
            s.settimeout(0.5)
            try:
                s.connect((host,port))
                self.address = host
                s.close()
                return True
            except:
                return False