part of 'hotel_bloc.dart';

sealed class HotelEvent extends Equatable {
  const HotelEvent();

  @override
  List<Object> get props => [];
}

class GetHotelList extends HotelEvent {}

class GetHotelByCategory extends HotelEvent {
  final String category;
  const GetHotelByCategory(this.category);

  @override
  List<Object> get props => [category];
}
