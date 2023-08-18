import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = "https://api.thecatapi.com/v1";
  final String apiKey = "bda53789-d59e-46cd-9bc4-2936630fde39";

  Future<http.Response> getBreeds() async {
    final response = await http.get(
      Uri.parse('$baseUrl/breeds'),
      headers: {'x-api-key': apiKey},
    );
    return response;
  }
}
