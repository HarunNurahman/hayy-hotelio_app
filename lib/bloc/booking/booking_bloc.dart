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
        emit(BookingLoading());
        try {
          await BookingService.addBooking(event.userId, event.booking);
          emit(BookingSuccess(event.userId, event.booking));
        } catch (e) {
          emit(BookingFailed(e.toString()));
        }
      }
    });
  }
}
