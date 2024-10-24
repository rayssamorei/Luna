import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_background_service_android/flutter_background_service_android.dart';

void iniciarServicoDeFundo() async {
  final service = FlutterBackgroundService();
  
  // Verifica se o serviço já está rodando
  bool isRunning = await service.isRunning();
  if (isRunning) {
    return;
  }

  // Inicializa o serviço de fundo
  service.startService();
}

void onStart(ServiceInstance service) {
  if (service is AndroidServiceInstance) {
    service.on('stopService').listen((event) {
      service.stopSelf();
    });
  }

  // Lógica de monitoramento de botões de volume em segundo plano
  service.on('volumeButtonPressed').listen((event) {
    // Aciona o botão de emergência
    print('Botão de volume pressionado em segundo plano! Acionar emergência.');
    // Aqui você pode adicionar lógica para enviar uma mensagem de emergência
  });
}

Future<void> iniciarBackgroundService() async {
  await FlutterBackgroundService.initialize(onStart);
}
