import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class DefaultApi {
    Future<GetStatus200Response> GetStatus(
    ) async {
        final response = await http.post(
            Uri.parse('https://api.spacetraders.io/v2/'),
            headers: {
                'Content-Type': 'application/json',
            },
            body: json.encode({
            }),
        );

        if (response.statusCode == 200) {
            return GetStatus200Response.fromJson(json.decode(response.body));
        } else {
            throw Exception('Failed to load GetStatus');
        }
    }
    Future<Register201Response> Register(
    ) async {
        final response = await http.post(
            Uri.parse('https://api.spacetraders.io/v2/register'),
            headers: {
                'Content-Type': 'application/json',
            },
            body: json.encode({
            }),
        );

        if (response.statusCode == 200) {
            return Register201Response.fromJson(json.decode(response.body));
        } else {
            throw Exception('Failed to load Register');
        }
    }
}
