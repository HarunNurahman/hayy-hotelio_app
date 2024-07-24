import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hayy_hotelio_app/models/booking_model.dart';
import 'package:hayy_hotelio_app/services/booking_service.dart';

part 'booking_event.dart';
part 'booking_state.dart';

class BookingBloc extends Bloc<BookingEvent, BookingState> {
  BookingBloc() : super(BookingInitial()) {
    on<BookingEvent>((event, emit) async {
      if (event is AddBooking) {
        try {
          emit(BookingLoading());
          await BookingService.addBooking(event.userId, event.booking);
          List<BookingModel> bookings =
              await BookingService.getBooking(event.userId);
          emit(BookingSuccess(bookings));
        } catch (e) {
          emit(BookingFailed(e.toString()));
        }
      }

      if (event is GetBooking) {
        try {
          emit(BookingLoading());
          List<BookingModel> bookings =
              await BookingService.getBooking(event.userId);
          emit(BookingSuccess(bookings));
        } catch (e) {
          emit(BookingFailed(e.toString()));
        }
      }

      if (event is EmptyBooking) {
        try {
          emit(BookingLoading());
          emit(const BookingSuccess([]));
        } catch (e) {
          emit(BookingFailed(e.toString()));
        }
      }
    });
  }
}
