import 'package:mobile/features/idea/domain/entities/lean_canvas.dart';

class LeanCanvasModel extends LeanCanvas {
  const LeanCanvasModel({
    String? problem,
    String? customerSegments,
    String? solution,
    String? uniqueValueProposition,
    String? channels,
    String? revenueStreams,
    String? costStructure,
    String? keyMetrics,
    String? unfairAdvantage,
    String? id,
    String? createdAt,
    String? updatedAt,
    String? stripeLink,
  }) : super(
    problem: problem,
    customerSegments: customerSegments,
    solution: solution,
    uniqueValueProposition: uniqueValueProposition,
    channels: channels,
    revenueStreams: revenueStreams,
    costStructure: costStructure,
    keyMetrics: keyMetrics,
    unfairAdvantage: unfairAdvantage,
    id : id,
    createdAt:  createdAt,
    updatedAt: updatedAt,
    stripeLink: stripeLink
  );

  factory LeanCanvasModel.fromJson(Map<String, dynamic> json) {
    return LeanCanvasModel(
      problem: json['problem'],
      customerSegments: json['customerSegments'],
      solution: json['solution'],
      uniqueValueProposition: json['uniqueValueProposition'],
      channels: json['channels'],
      revenueStreams: json['revenueStreams'],
      costStructure: json['costStructure'],
      keyMetrics: json['keyMetrics'],
      unfairAdvantage: json['unfairAdvantage'],
      id: json['_id'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      stripeLink: json['stripeLink'],
    );
  }
}