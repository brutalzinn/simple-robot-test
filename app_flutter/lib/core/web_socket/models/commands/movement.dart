class Movement {
  final String direction;
  final int velocity;
  final int time;

  Movement({
    required this.direction,
    required this.velocity,
    required this.time,
  });

  factory Movement.fromJson(Map<String, dynamic> json) {
    return Movement(
      direction: json['direction'],
      velocity: json['velocity'],
      time: json['time'],
    );
  }
}

class Command {
  String? type = "command";
  final Movement movement;

  Command({
    this.type,
    required this.movement,
  });

  factory Command.fromJson(Map<String, dynamic> json) {
    return Command(
      type: json['type'],
      movement: Movement.fromJson(json['movement']),
    );
  }
}
