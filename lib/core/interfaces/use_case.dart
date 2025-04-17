/// An abstraction for all the usecases in the application
abstract class UseCase<Output, Input> {
  Output call(Input params);
}
