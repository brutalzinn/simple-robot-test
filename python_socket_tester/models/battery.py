class Battery:
    def __init__(self, value):
        self.value = value

    def to_json(self):
        return {
            "type": "response",
            "battery": {
                "value": self.battery.value
            }
        }