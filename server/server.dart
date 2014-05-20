library example_forcedart;

import 'dart:io';
import 'dart:async';
import 'dart:math';
import 'package:forcemvc/force_mvc.dart';

part 'controllers/post_controller.dart';
part 'controllers/login_controller.dart';
part 'controllers/redirect_controller.dart';
part 'controllers/path_controller.dart';
part 'controllers/count_controller.dart';
part 'controllers/secure_controller.dart';
part 'controllers/random_interceptor.dart';

part 'controllers/security/session_strategy.dart';

void main() { 
  // Setup what port to listen to 
  var portEnv = Platform.environment['PORT'];
  var port = portEnv == null ? 8080 : int.parse(portEnv);
  var serveClient = portEnv == null ? true : false;
  
  // Create a force server 
  WebServer server = new WebServer(host: "127.0.0.1",
                                   port: port,  
                                   clientFiles: '../client/',
                                   clientServe: serveClient,
                                   views: "views/");
  // Set up logger.
  server.setupConsoleLog();
  
  // Setup session strategy
  server.strategy = new SessionStrategy();
  
  // Serve the view called index as default 
  server.on("/", (req, model) => "index");
  
  // Start serving force 
  server.start();
}

