part of 'filter_bloc.dart';

@immutable
sealed class FilterEvent {}

class AscendingEvent extends FilterEvent {}

class DescendingEvent extends FilterEvent {}
