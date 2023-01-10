class Rain {
  double? onehour;

  Rain({this.onehour});

  factory Rain.fromJson(Map<String, Object?> json) => Rain(
        onehour: (json['onehour'] as num?)?.toDouble(),
      );

  Map<String, Object?> toJson() => {
        'onehour': onehour,
      };
}
