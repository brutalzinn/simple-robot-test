import json

from models.directions import Directions


class Motion:
    """
    Cria um movimento.
    """
    def __init__(self, direction: Directions, velocity, time = 100):
        self.direction = direction
        self.velocity = velocity
        self.time = time
    
    def to_json(self):
        return json.dumps({
            "direction": self.direction.value,
            "velocity": self.velocity,
            "time": self.time
        })