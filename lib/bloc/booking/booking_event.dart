part of 'booking_bloc.dart';

sealed class BookingEvent extends Equatable {
  const BookingEvent();

  @override
  List<Object> get props => [];
}

class AddBooking extends BookingEvent {
  final String userId;
  final BookingModel booking;
  const AddBooking(this.userId, this.booking);

  @override
  List<Object> get props => [userId, booking];
}
