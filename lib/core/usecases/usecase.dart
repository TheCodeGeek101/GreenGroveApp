// Generic abstract class defining a use case in the application
abstract class UseCase<Type, Params> {
   // Asynchronous method signature for executing the use case
   // The method returns a Future of Type and takes named parameters of type Params
   Future<Type> call({required Params params});
}
