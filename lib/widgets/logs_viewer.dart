import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/connection_provider.dart';

class LogsViewer extends StatelessWidget {
  const LogsViewer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ConnectionProvider>(
      builder: (context, provider, _) {
        return Card(
          color: const Color(0xFF1A1F3A),
          elevation: 8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: const BorderSide(
              color: Colors.greenAccent,
              width: 2,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'LOGS',
                      style: TextStyle(
                        color: Colors.greenAccent,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    ElevatedButton.icon(
                      onPressed: provider.clearLogs,
                      icon: const Icon(Icons.delete, size: 16),
                      label: const Text('Clear'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.redAccent,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),

                // Logs Container
                Container(
                  height: 300,
                  decoration: BoxDecoration(
                    color: const Color(0xFF0F1229),
                    borderRadius: BorderRadius.circular(8),
                    border: const Border(
                      left: BorderSide(
                        color: Colors.greenAccent,
                        width: 3,
                      ),
                    ),
                  ),
                  child: provider.logs.isEmpty
                      ? Center(
                          child: Text(
                            'No logs yet...',
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 12,
                            ),
                          ),
                        )
                      : ListView.builder(
                          reverse: true,
                          itemCount: provider.logs.length,
                          itemBuilder: (context, index) {
                            final log = provider.logs[provider.logs.length - 1 - index];
                            final isError = log.contains('[-]');
                            final isSuccess = log.contains('[+]');
                            final isInfo = log.contains('[*]');

                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 4,
                              ),
                              child: Text(
                                log,
                                style: TextStyle(
                                  color: isError
                                      ? Colors.redAccent
                                      : isSuccess
                                          ? Colors.greenAccent
                                          : isInfo
                                              ? Colors.cyanAccent
                                              : Colors.grey[300],
                                  fontSize: 11,
                                  fontFamily: 'Courier',
                                ),
                              ),
                            );
                          },
                        ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
