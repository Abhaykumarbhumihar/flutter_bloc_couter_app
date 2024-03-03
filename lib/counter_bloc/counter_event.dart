sealed class CounterEvent{

}

final class CounterIncrementEvent extends CounterEvent{

}

class CounterDecrementEvent extends CounterEvent{

}

class CounterToggleVisibilityEvent extends CounterEvent {
  final bool isVisible;

  CounterToggleVisibilityEvent(this.isVisible);
}