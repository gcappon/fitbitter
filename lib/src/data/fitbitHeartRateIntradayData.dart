class FitbitIntradayHeartRate {
  const FitbitIntradayHeartRate({
    required this.dataset,
    required this.datasetInterval,
    required this.datasetType,
  });

  final List<FitbitHeartRateSample> dataset;
  final int datasetInterval;
  final String datasetType;

  factory FitbitIntradayHeartRate.fromJson(Map<String, dynamic> json) {
    final datasetJson = json['dataset'] as List<dynamic>? ?? [];
    return FitbitIntradayHeartRate(
      dataset: datasetJson.map((e) => FitbitHeartRateSample.fromJson(e)).toList(),
      datasetInterval: json['datasetInterval'] ?? 1,
      datasetType: json['datasetType'] ?? 'second',
    );
  }

  Map<String, dynamic> toJson() => {
        'dataset': dataset.map((e) => e.toJson()).toList(),
        'datasetInterval': datasetInterval,
        'datasetType': datasetType,
      };
}

class FitbitHeartRateSample {
  FitbitHeartRateSample({
    required this.time,
    required this.value,
  });

  final String? time;
  final int? value;

  factory FitbitHeartRateSample.fromJson(Map<String, dynamic> json) {
    return FitbitHeartRateSample(
      time: json['time'] as String?,
      value: json['value'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {'time': time, 'value': value};
}
