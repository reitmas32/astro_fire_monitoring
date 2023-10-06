class FireDetection {
  double latitude;
  double longitude;
  double brightTi4;
  double scan;
  double track;
  String acqDate;
  int acqTime;
  String satellite;
  String instrument;
  String confidence;
  String version;
  double brightTi5;
  double frp;
  String dayNight;

  FireDetection({
    required this.latitude,
    required this.longitude,
    required this.brightTi4,
    required this.scan,
    required this.track,
    required this.acqDate,
    required this.acqTime,
    required this.satellite,
    required this.instrument,
    required this.confidence,
    required this.version,
    required this.brightTi5,
    required this.frp,
    required this.dayNight,
  });

  factory FireDetection.fromJson(Map<String, dynamic> json) {
    return FireDetection(
      latitude: json['latitude'],
      longitude: json['longitude'],
      brightTi4: json['bright_ti4'],
      scan: json['scan'],
      track: json['track'],
      acqDate: json['acq_date'],
      acqTime: json['acq_time'],
      satellite: json['satellite'],
      instrument: json['instrument'],
      confidence: json['confidence'],
      version: json['version'],
      brightTi5: json['bright_ti5'],
      frp: json['frp'],
      dayNight: json['daynight'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'latitude': latitude,
      'longitude': longitude,
      'bright_ti4': brightTi4,
      'scan': scan,
      'track': track,
      'acq_date': acqDate,
      'acq_time': acqTime,
      'satellite': satellite,
      'instrument': instrument,
      'confidence': confidence,
      'version': version,
      'bright_ti5': brightTi5,
      'frp': frp,
      'daynight': dayNight,
    };
  }

  Map<String, dynamic> toJson() => toMap();

  @override
  String toString() {
    return 'FireDetection(${toMap()})';
  }
}
