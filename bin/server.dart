library example_forcedart;

import 'dart:io';
import 'package:forcemvc/force_mvc.dart';
import 'package:logging/logging.dart' show Logger, Level, LogRecord;
import 'dart:math';

part 'path_controller.dart';
part 'count_controller.dart';
part 'random_interceptor.dart';

final Logger log = new Logger('ChatApp');

void main() { 
  // Set up logger.
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((LogRecord rec) {
    print('${rec.level.name}: ${rec.time}: ${rec.message}');
  });
  
  var portEnv = Platform.environment['PORT'];
  var port = portEnv == null ? 8080 : int.parse(portEnv);
  
  WebServer server = new WebServer(host: "0.0.0.0", buildPath: "../build/", port: port);

  server.on("/", (req, model) {
    return "index";
  });
  server.start().then((_) {
    server.serve("/client.dart").listen((request) { 
      server.serveFile("../web/client.dart", request);
    });
  });
}
