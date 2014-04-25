library example_forcedart;

import 'dart:io';
import 'dart:async';
import 'package:forcemvc/force_mvc.dart';
import 'package:logging/logging.dart' show Logger, Level, LogRecord;
import 'dart:math';

part 'controllers/post_controller.dart';
part 'controllers/login_controller.dart';
part 'controllers/redirect_controller.dart';
part 'controllers/path_controller.dart';
part 'controllers/count_controller.dart';
part 'controllers/secure_controller.dart';
part 'controllers/random_interceptor.dart';

part 'controllers/security/session_strategy.dart';

final Logger log = new Logger('ForceMVC');

void main() { 
  // Set up logger.
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((LogRecord rec) {
    print('${rec.level.name}: ${rec.time}: ${rec.message}');
  });
  
  // Setup what port to listen to 
  var portEnv = Platform.environment['PORT'];
  var port = portEnv == null ? 8080 : int.parse(portEnv);
  
  // Create a force server 
  WebServer server = new WebServer(host: "127.0.0.1",
                                   port: port,  
                                   clientFiles: '../client/',
                                   clientServe: false,
                                   views: "views/");
  
  // Setup session strategy
  server.strategy = new SessionStrategy();
  
  // Serve the view called index as default 
  server.on("/", (req, model) => "index");
  
  // Start serving force 
  server.start();
}

