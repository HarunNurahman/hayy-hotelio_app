import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hayy_hotelio_app/models/hotel_model.dart';
import 'package:hayy_hotelio_app/services/hotel_service.dart';

part 'hotel_event.dart';
part 'hotel_state.dart';

class HotelBloc extends Bloc<HotelEvent, HotelState> {
  HotelBloc() : super(HotelInitial()) {
    on<HotelEvent>((event, emit) async {
      if (event is GetHotelList) {
        try {
          emit(HotelLoading());
          final hotelList = await HotelService().getHotelList();
          emit(HotelSuccess(hotelList));
        } catch (e) {
          emit(HotelFailed(e.toString()));
        }
      }

      if (event is GetHotelByCategory) {
        try {
          emit(HotelLoading());
          final hotelCategory = await HotelService().getHotelByCategory(
            event.category,
          );
          emit(HotelSuccess(hotelCategory));
        } catch (e) {
          emit(HotelFailed(e.toString()));
        }
      }

      if (event is GetHotelByName) {
        try {
          emit(HotelLoading());
          final hotelName = await HotelService().getHotelByName(event.query);
          emit(HotelSuccess(hotelName));
        } catch (e) {
          emit(HotelFailed(e.toString()));
        }
      }
    });
  }
}
