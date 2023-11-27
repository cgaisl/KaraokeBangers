import 'package:rxdart/rxdart.dart';

// Extension on ValueStream
extension MapValueStream<T> on ValueStream<T> {
  ValueStream<R> mapValueStream<R>(R Function(T) mutationFunction) {
    return map(mutationFunction).shareValueSeeded(mutationFunction(value));
  }
}
