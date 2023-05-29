// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class AppState extends Equatable {
  final bool pinSeted;

  const AppState({
    this.pinSeted = false,
  });

  AppState copyWith({
    bool? pinSeted,
  }) {
    return AppState(
      pinSeted: pinSeted ?? this.pinSeted,
    );
  }

  @override
  List<Object?> get props => [pinSeted];
}
