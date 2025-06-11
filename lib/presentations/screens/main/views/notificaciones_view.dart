import 'package:flutter/material.dart';

class NotificationItem {
  final String title;
  final String subtitle;
  final String timeAgo;
  NotificationItem({
    required this.title,
    required this.subtitle,
    required this.timeAgo,
  });
}

class NotificationsView extends StatelessWidget {
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    const horizontalPadding = 24.0;
    const verticalPadding = 16.0;

    final items = <NotificationItem>[
      NotificationItem(
        title: 'Extendimos los horarios',
        subtitle: 'Festivos de 8:00 a 4:00.\nLunes a Viernes 5:00 AM a 11:30PM...',
        timeAgo: '8m ago',
      ),
      NotificationItem(
        title: 'Vacante para entrenador',
        subtitle: 'HORARIO 5:30 PM a 11:30 PM.',
        timeAgo: '8m ago',
      ),
      NotificationItem(
        title: 'Ven y entrena con nosotros',
        subtitle: 'Planes semipersonalizado totalmente GRATIS.\nSEGUIMIENTO DE TUS AVANCES MES...',
        timeAgo: '8m ago',
      ),
      NotificationItem(
        title: 'Grupo de whatsapp',
        subtitle: 'Si quieres pertenecer al grupo de whatsapp de clases grupales escribe a...',
        timeAgo: '8m ago',
      ),
    ];

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: horizontalPadding,
          vertical: verticalPadding,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Título centrado
            const Text(
              'Notificaciones',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),

            // Lista de notificaciones
            Expanded(
              child: ListView.separated(
                itemCount: items.length,
                separatorBuilder: (_, __) => const Divider(color: Colors.grey),
                itemBuilder: (context, index) {
                  final item = items[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Placeholder de imagen
                        Container(
                          width: 48,
                          height: 48,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        const SizedBox(width: 12),

                        // Texto de título y subtítulo
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.title,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                item.subtitle,
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.black87,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(width: 8),
                        // Timestamp
                        Text(
                          item.timeAgo,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
