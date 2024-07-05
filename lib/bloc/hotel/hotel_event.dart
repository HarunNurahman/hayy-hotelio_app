part of 'hotel_bloc.dart';

sealed class HotelEvent extends Equatable {
  const HotelEvent();

  @override
  List<Object> get props => [];
}

class GetListHotel extends HotelEvent {}

class GetHotelCategory extends HotelEvent {
  final String category;
  const GetHotelCategory(this.category);

  @override
  List<Object> get props => [category];
}
