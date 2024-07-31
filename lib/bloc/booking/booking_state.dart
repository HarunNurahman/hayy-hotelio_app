part of 'booking_bloc.dart';

sealed class BookingState extends Equatable {
  const BookingState();

  @override
  List<Object> get props => [];
}

final class BookingInitial extends BookingState {}

final class BookingLoading extends BookingState {}

final class BookingSuccess extends BookingState {
  final List<BookingModel> booking;
  const BookingSuccess(this.booking);

  @override
  List<Object> get props => [booking];
}

final class BookingFailed extends BookingState {
  final String errorMessage;
  const BookingFailed(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
