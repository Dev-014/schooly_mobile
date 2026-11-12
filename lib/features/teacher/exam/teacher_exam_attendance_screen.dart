import 'package:flutter/material.dart';

class TeacherExamAttendanceScreen extends StatefulWidget {
  const TeacherExamAttendanceScreen({super.key});

  @override
  State<TeacherExamAttendanceScreen> createState() =>
      _TeacherExamAttendanceScreenState();
}

class _TeacherExamAttendanceScreenState
    extends State<TeacherExamAttendanceScreen> {
  // Map of roll number to status (true = present, false = absent)
  final Map<String, bool> _attendance = {
    '01': true,
    '02': true,
    '03': false,
    '04': true,
    '05': true,
  };

  void _markAllPresent() {
    setState(() {
      _attendance.updateAll((key, value) => true);
    });
  }

  @override
  Widget build(BuildContext context) {
    // Custom colors matching the design closely
    const Color bgBlueLight = Color(0xFFF0F4FF);
    const Color bgBlueDark = Color(0xFFDBEAFE);
    const Color textBlueDark = Color(0xFF1E40AF);
    const Color textBlue = Color(0xFF0284C7);
    const Color bgGreenLight = Color(0xFFDCFCE7);
    const Color textGreen = Color(0xFF15803D);
    const Color bgRedLight = Color(0xFFFEE2E2);
    const Color textRed = Color(0xFFDC2626);
    const Color bgSlate = Color(0xFFF1F5F9);
    const Color textSlate = Color(0xFF475569);
    const Color bgMain = Color(0xFFF5F7FC);

    int total = 42; // Hardcoded for this mockup
    int present = _attendance.values.where((v) => v).length + 35; // pad to 40
    int absent = _attendance.values.where((v) => !v).length;
    double progress = total == 0 ? 0 : present / total;

    return Scaffold(
      backgroundColor: bgMain,
      appBar: AppBar(
        backgroundColor: bgMain,
        elevation: 0,
        scrolledUnderElevation: 1,
        title: const Text(
          'Exam Attendance',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 80),
        child: Column(
          children: [
            // Top Exam Context Card
            Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.04),
                      blurRadius: 20,
                    ),
                  ],
                  border: Border.all(color: Colors.grey.shade100),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 2,
                                    ),
                                    decoration: BoxDecoration(
                                      color: bgBlueDark,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: const Text(
                                      'MIDTERM EXAM',
                                      style: TextStyle(
                                        color: textBlueDark,
                                        fontSize: 11,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 2,
                                    ),
                                    decoration: BoxDecoration(
                                      color: bgSlate,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: const Text(
                                      'Class 10-A',
                                      style: TextStyle(
                                        color: textSlate,
                                        fontSize: 11,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                'Exam Hall 3 • Ground Floor',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.menu_book,
                                    size: 16,
                                    color: textBlue,
                                  ),
                                  const SizedBox(width: 4),
                                  const Text(
                                    'Mathematics',
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      color: textBlue,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 48,
                          height: 48,
                          decoration: BoxDecoration(
                            color: Colors.lightBlue.shade50,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: const Icon(Icons.calculate, color: textBlue),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: bgBlueLight,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.calendar_today,
                            size: 16,
                            color: textBlue,
                          ),
                          const SizedBox(width: 4),
                          const Text(
                            'Mon, 28 Sep',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: textSlate,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 4),
                            child: Text(
                              '•',
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                          const Icon(Icons.schedule, size: 16, color: textBlue),
                          const SizedBox(width: 4),
                          const Text(
                            '09:30 AM – 12:30 PM',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: textSlate,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        _buildStatBox(
                          'TOTAL',
                          total.toString(),
                          bgBlueLight,
                          textSlate,
                          Colors.black87,
                        ),
                        const SizedBox(width: 10),
                        _buildStatBox(
                          'PRESENT',
                          present.toString(),
                          bgGreenLight,
                          textGreen,
                          textGreen,
                        ),
                        const SizedBox(width: 10),
                        _buildStatBox(
                          'ABSENT',
                          absent.toString(),
                          bgRedLight,
                          textRed,
                          textRed,
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Container(
                      height: 8,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: bgSlate,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            flex: (progress * 100).toInt(),
                            child: Container(
                              decoration: const BoxDecoration(
                                color: textGreen,
                                borderRadius: BorderRadius.horizontal(
                                  left: Radius.circular(4),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: ((1 - progress) * 100).toInt(),
                            child: Container(
                              decoration: const BoxDecoration(
                                color: textRed,
                                borderRadius: BorderRadius.horizontal(
                                  right: Radius.circular(4),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Search Controls
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.03),
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search, color: Colors.grey),
                    hintText: 'Search student name, roll, or desk...',
                    hintStyle: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade400,
                    ),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 14,
                    ),
                  ),
                ),
              ),
            ),

            // Quick-Action Strip
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Desk Order (Room 3)',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: textSlate,
                    ),
                  ),
                  GestureDetector(
                    onTap: _markAllPresent,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.indigo.shade50,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.done_all,
                            size: 16,
                            color: textGreen,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            'Mark All Present',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.indigo.shade700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Student List
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  _buildStudentCard('01', 'D-01', 'Aarav Sharma'),
                  const SizedBox(height: 8),
                  _buildStudentCard('02', 'D-02', 'Ananya Patel'),
                  const SizedBox(height: 8),
                  _buildStudentCard(
                    '03',
                    'D-03',
                    'Devansh Gupta',
                    isUnexcused: true,
                  ),
                  const SizedBox(height: 8),
                  _buildStudentCard('04', 'D-04', 'Diya Reddy'),
                  const SizedBox(height: 8),
                  _buildStudentCard('05', 'D-05', 'Ishaan Verma'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatBox(
    String title,
    String value,
    Color bg,
    Color titleColor,
    Color valColor,
  ) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
                color: titleColor,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              value,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: valColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStudentCard(
    String roll,
    String desk,
    String name, {
    bool isUnexcused = false,
  }) {
    bool isPresent = _attendance[roll] ?? true;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
        boxShadow: [
          BoxShadow(color: Colors.black.withValues(alpha: 0.02), blurRadius: 8),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF1F5F9),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        '#$roll',
                        style: const TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF475569),
                        ),
                      ),
                    ),
                    const SizedBox(width: 6),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFE0F2FE),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        desk,
                        style: const TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF0284C7),
                        ),
                      ),
                    ),
                    if (isUnexcused && !isPresent) ...[
                      const SizedBox(width: 6),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFEE2E2),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: const Text(
                          'Unexcused',
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFDC2626),
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0F172A),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: const Color(0xFFF1F3F9),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () => setState(() => _attendance[roll] = true),
                  child: Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      color: isPresent
                          ? const Color(0xFF006E2D)
                          : Colors.transparent,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        'P',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: isPresent
                              ? Colors.white
                              : const Color(0xFF64748B),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 4),
                GestureDetector(
                  onTap: () => setState(() => _attendance[roll] = false),
                  child: Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      color: !isPresent
                          ? const Color(0xFFDC2626)
                          : Colors.transparent,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        'A',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: !isPresent
                              ? Colors.white
                              : const Color(0xFF64748B),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
