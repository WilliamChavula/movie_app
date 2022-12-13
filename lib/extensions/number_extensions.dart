extension TimeFormat on num {
  String toTimeString() {
    final time = this;
    final hours = (time / 60).floor();
    final min = time.remainder(60);

    return '${hours}h ${min}m';
  }
}
