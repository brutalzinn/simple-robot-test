class Battery {
  final double value;

  Battery({
    required this.value,
  });

  factory Battery.fromJson(Map<String, dynamic> json) {
    return Battery(
      value: json['value'].toDouble(),
    );
  }
}

class Response {
  String? type = "response";
  final Battery battery;

  Response({
    this.type,
    required this.battery,
  });

  factory Response.fromJson(Map<String, dynamic> json) {
    return Response(
      type: json['type'],
      battery: Battery.fromJson(json['battery']),
    );
  }
}
