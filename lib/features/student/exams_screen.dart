import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/app_theme.dart';

class ExamsScreen extends StatelessWidget {
  const ExamsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('Available Exams', style: TextStyle(color: Theme.of(context).brightness == Brightness.dark ? Colors.white : AppTheme.textDark)),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: 4,
        itemBuilder: (context, index) {
          return _buildExamCard(context, index);
        },
      ),
    );
  }

  Widget _buildExamCard(BuildContext context, int index) {
    final exams = [
      {
        'title': 'Mathematics Final Exam',
        'subject': 'Mathematics',
        'duration': '90 min',
        'questions': 50,
        'deadline': '2025-11-30',
        'status': 'available'
      },
      {
        'title': 'Physics Mid-Term',
        'subject': 'Physics',
        'duration': '60 min',
        'questions': 30,
        'deadline': '2025-11-28',
        'status': 'available'
      },
      {
        'title': 'English Literature Quiz',
        'subject': 'English',
        'duration': '45 min',
        'questions': 25,
        'deadline': '2025-11-26',
        'status': 'completed'
      },
      {
        'title': 'Biology Chapter Test',
        'subject': 'Biology',
        'duration': '75 min',
        'questions': 40,
        'deadline': '2025-12-05',
        'status': 'available'
      },
    ];

    final exam = exams[index];
    final isCompleted = exam['status'] == 'completed';

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.dark ? const Color(0xFF2D2D44) : Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: isCompleted ? Colors.green.withOpacity(0.3) : const Color(0xFF7C7CFF).withOpacity(0.3),
          width: 1.5,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  exam['title'] as String,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: Theme.of(context).brightness == Brightness.dark ? Colors.white : AppTheme.textDark,
                  ),
                ),
              ),
              if (isCompleted)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.green.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    'Completed',
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              _buildInfoChip(Icons.access_time, exam['duration'] as String),
              const SizedBox(width: 12),
              _buildInfoChip(Icons.quiz_outlined, '${exam['questions']} Questions'),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Icon(Icons.calendar_today, size: 14, color: AppTheme.textGrey),
              const SizedBox(width: 6),
              Text(
                'Deadline: ${exam['deadline']}',
                style: TextStyle(
                  fontSize: 13,
                  color: AppTheme.textGrey,
                ),
              ),
            ],
          ),
          if (!isCompleted) ...[
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  context.push('/exam/detail/${index}');
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                child: const Text('Start Exam'),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildInfoChip(IconData icon, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: AppTheme.lightPurple.withOpacity(0.5),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: AppTheme.primaryPurple),
          const SizedBox(width: 4),
          Text(
            text,
            style: const TextStyle(
              fontSize: 12,
              color: AppTheme.textDark,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
