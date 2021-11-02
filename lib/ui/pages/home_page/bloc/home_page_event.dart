class HomePageEvent {
  const HomePageEvent();
}

class RunLoaderEvent extends HomePageEvent {}

class StopLoaderEvent extends HomePageEvent {}

class LoadIngredientsWithNameEvent extends HomePageEvent {
  final String str;

  const LoadIngredientsWithNameEvent({
    required this.str,
  });
}

class ClearIngredientsEvent extends HomePageEvent {}
