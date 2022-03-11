import 'dart:async';
import 'dart:convert';

import 'package:chopper/chopper.dart';
import 'package:japx/japx.dart';
import 'package:pokemon/data/models/models.dart';

class FirstfetchConverter extends Converter {
  Request encodeJson(Request request) {

    var contentType = request.headers[contentTypeKey];
    if (contentType != null && contentType.contains(jsonHeaders)) {
      return request.copyWith(body: json.encode(request.body));
    }
    return request;
  }


  FutureOr<Response<BodyType>> decodeJson<BodyType, InnerType>(Response response) {
    var contentType = response.headers[contentTypeKey];
    var body = response.body;
    if (contentType != null && contentType.contains(jsonHeaders)) {
      body = utf8.decode(response.bodyBytes);
    }
    try {
      var mapData = json.decode(body);
      var data = PokemonResponse.fromJson(mapData);
      return response.copyWith<BodyType>(body: data as BodyType);
    } catch (e) {
      chopperLogger.warning(e);
      return response.copyWith<BodyType>(body: body);
    }
  }





  @override
  FutureOr<Request> convertRequest(Request request) {
    final req = applyHeader(
      request,
      contentTypeKey,
      jsonHeaders,
      override: false,
    );

    return encodeJson(req);
  }

 @override
  FutureOr<Response<BodyType>> convertResponse<BodyType, InnerType>(Response response) {
   return decodeJson<BodyType, InnerType>(response);
  }

}