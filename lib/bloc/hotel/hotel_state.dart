part of 'hotel_bloc.dart';

sealed class HotelState extends Equatable {
  const HotelState();

  @override
  List<Object> get props => [];
}

final class HotelInitial extends HotelState {}

final class HotelLoading extends HotelState {}

final class HotelSuccess extends HotelState {
  final List<HotelModel> hotel;
  const HotelSuccess(this.hotel);

  @override
  List<Object> get props => [hotel];
}

final class HotelFailed extends HotelState {
  final String errorMessage;
  const HotelFailed(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
