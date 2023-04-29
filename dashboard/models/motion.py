import json

from models.directions import Directions


class Motion:

    def __init__(self, direction: Directions, velocity: int, time:int = 1):
        """
        Create a motion
        :param Directions direction: The directions enum LEFT, RIGHT, FORWARD and REVERSE
        :param int velocity: The velocity of motors A and B
        :param int time: The time in MS to wait after the moviment.
        """
        self.direction = direction
        self.velocity = velocity
        self.time = time
    
    def to_json(self):
        return json.dumps({
            "direction": self.direction.value,
            "velocity": self.velocity,
            "time": self.time
        })