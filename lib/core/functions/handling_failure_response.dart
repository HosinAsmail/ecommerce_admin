import 'package:ecommerce_admin/core/api/status_request.dart';

String? handlingFailureMessage(response, String noDataMessage) {
  if (response == StatusFailureRequest.severFailure) {
    return "failed connect to the server";
  } else if (response == StatusFailureRequest.noData) {
    return noDataMessage;
  } else {
    return null;
  }
}
