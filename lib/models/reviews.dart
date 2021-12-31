import 'package:equatable/equatable.dart';

class StoreReviews extends Equatable {
  final String name;
  final String review;

  StoreReviews({required this.name, required this.review});

  StoreReviews copyWith({
    String? name,
    String? review,
  }) =>
      StoreReviews(
        name: name ?? this.name,
        review: review ?? this.review,
      );

  factory StoreReviews.fromJson(Map<String, dynamic> json) => StoreReviews(
        name: json['name'],
        review: json['review'],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "review": review,
      };

  @override
  // TODO: implement props
  List<Object?> get props => [name, review];
}
