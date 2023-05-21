from concurrent.futures.thread import ThreadPoolExecutor
import socket

class Finder:
    def __init__(self, gateway:str, port: int):
        """
        Init a class finder. This will be used to search the esp 01 at the network.
        :param str gateway: The gateway of the current network. Normally will be 192.168.0.1 for common networks.
        :param int port: The Esp 01 port
        """
        self.address = "0.0.0.0"
        self.gateway = gateway
        self.base_gateway = gateway.rsplit('.', 1)[0]
        self.port = port

    def waitAddress(self):
        print("Trying to find esp 01 module in the network..")
        with ThreadPoolExecutor() as executor:
            for i in range(1, 255):
                self.address = f"{self.base_gateway}.{i}"
                executor.submit(self.__find, self.address, self.port)
        if self.address  == self.gateway:
            raise ValueError("The clock of invisibility really works.. ESP 01 is trying to be Harry Potter?")
        print("The cloak of invisibility didn't work.")
        print(f"esp was found at {self.address}")
        return self.address
    
    def __find(self, host:str, port:int):
            """
            :param str host: host address
            :param str port: esp port address
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