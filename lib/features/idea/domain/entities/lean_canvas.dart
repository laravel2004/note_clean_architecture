// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class LeanCanvas extends Equatable {

  final String? problem;
  final String? customerSegments;
  final String? solution;
  final String? uniqueValueProposition;
  final String? channels;
  final String? revenueStreams;
  final String? costStructure;
  final String? keyMetrics;
  final String? unfairAdvantage;
  final String? id;
  final String? createdAt;
  final String? updatedAt;
  final String? stripeLink;
  const LeanCanvas({
    this.problem,
    this.customerSegments,
    this.solution,
    this.uniqueValueProposition,
    this.channels,
    this.revenueStreams,
    this.costStructure,
    this.keyMetrics,
    this.unfairAdvantage,
    this.id,
    this.createdAt,
    this.updatedAt,
    this.stripeLink,
  });
  
  @override
  List<Object?> get props => [problem!, customerSegments!, solution!, uniqueValueProposition!, channels!, revenueStreams!, costStructure!, keyMetrics!, unfairAdvantage!, id!, createdAt!, updatedAt!, stripeLink!];

}
