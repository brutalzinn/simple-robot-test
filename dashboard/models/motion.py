import json

class Motion:
    def __init__(self, direction, velocity, time):
        self.direction = direction
        self.velocity = velocity
        self.time = time
    
    def to_json(self):
        return json.dumps({
            "direction": self.direction,
            "velocity": self.velocity,
            "time": self.time
        })