import 'dart:io';
import 'package:appengine/appengine.dart';
import 'package:logging/logging.dart';

final _log = Logger('MyClassName');

void handlerRequest(HttpRequest request){
  // if (request.requestedUri.path == '/liveness_check') {
  //   request.response
  //     ..statusCode = 200
  //     ..write('server is alive')
  //     ..close();
  //   return;
  // }

  // if (request.requestedUri.path == '/readiness_check') {
  //   request.response
  //     ..statusCode = 200
  //     ..write('server is ready')
  //     ..close();
  //   return;
  // }

  // _log.info('request for path: ${request.requestedUri.path}');
  // try {
  //   if (request.requestedUri.path == '/error') {
  //     throw Exception('Something bad happens when hitting this path');
  //   }
  // } on Exception catch (e, st) {
  //   // This will log the message to stackdriver logging along with the error
  //   // and stack trace. This will also send error and stack trace to stackdriver
  //   // error reporting service.
  //   _log.severe('a bad thing happend', e, st);
  // }
  
  request.response
      ..write('Hello, world!')
      ..close();
}

main() async {
  await runAppEngine(handlerRequest);
  // await withAppEngineServices(() async {
  //   useLoggingPackageAdaptor();

    
  // });
}