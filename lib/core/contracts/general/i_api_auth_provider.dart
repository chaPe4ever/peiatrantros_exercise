abstract class IApiAuthProvider {
  Future<dynamic> getAsync({
    required String path,
    String? authToken,
  });

  Future<dynamic> postAsync({
    required String path,
    dynamic? data,
    String? authToken,
  });

  Future<dynamic> deleteAsync({
    required String path,
    String? authToken,
  });

  Future<dynamic> putAsync({
    required String path,
    dynamic? data,
    String? authToken,
  });
}
