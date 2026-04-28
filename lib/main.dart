import 'package:flutter/material.dart';
import 'package:smart_date_formatter/smart_date_formatter.dart';

void main() => runApp(const SmartDateDemoApp());

class SmartDateDemoApp extends StatelessWidget {
  const SmartDateDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Date Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorSchemeSeed: Colors.indigo, useMaterial3: true),
      home: const DemoHomePage(),
    );
  }
}

class DemoHomePage extends StatefulWidget {
  const DemoHomePage({super.key});

  @override
  State<DemoHomePage> createState() => _DemoHomePageState();
}

class _DemoHomePageState extends State<DemoHomePage> {
  final List<Map<String, dynamic>> _messages = [
    {
      'sender': 'Rahul',
      'text': 'Hey! Did you check the Flutter 4.0 release?',
      'time': DateTime.now().subtract(const Duration(seconds: 5)),
      'isMe': false,
    },
    {
      'sender': 'Me',
      'text': 'Just now! Looks amazing 🚀',
      'time': DateTime.now().subtract(const Duration(seconds: 3)),
      'isMe': true,
    },
    {
      'sender': 'Rahul',
      'text': 'The new rendering engine is insane!',
      'time': DateTime.now().subtract(const Duration(minutes: 2)),
      'isMe': false,
    },
    {
      'sender': 'Me',
      'text': 'Agreed. Already migrating my projects.',
      'time': DateTime.now().subtract(const Duration(minutes: 45)),
      'isMe': true,
    },
    {
      'sender': 'Priya',
      'text': 'Don\'t forget our standup call!',
      'time': DateTime.now().subtract(const Duration(hours: 3)),
      'isMe': false,
    },
    {
      'sender': 'Me',
      'text': 'On it! 👍',
      'time': DateTime.now().subtract(const Duration(hours: 5)),
      'isMe': true,
    },
    {
      'sender': 'Rahul',
      'text': 'Package published successfully bro 🎉',
      'time': DateTime.now().subtract(const Duration(days: 1)),
      'isMe': false,
    },
    {
      'sender': 'Priya',
      'text': 'Congrats on your first pub.dev package!',
      'time': DateTime.now().subtract(const Duration(days: 3)),
      'isMe': false,
    },
    {
      'sender': 'Me',
      'text': 'Thanks everyone 🙏',
      'time': DateTime.now().subtract(const Duration(days: 8)),
      'isMe': true,
    },
    {
      'sender': 'Rahul',
      'text': 'Remember when we started Flutter?',
      'time': DateTime.now().subtract(const Duration(days: 40)),
      'isMe': false,
    },
    {
      'sender': 'Me',
      'text': 'Those were the days! 😄',
      'time': DateTime.now().subtract(const Duration(days: 400)),
      'isMe': true,
    },
  ];

  int _selectedTab = 0;

  // All 5 tabs
  final List<String> _tabs = [
    '💬 Chat',
    '📅 Calendar',
    '🔌 Extensions',
    '🎨 Formats',
    '🧮 Calculations',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        title: const Text(
          'smart_date_formatter demo',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(48),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                _tabs.length,
                (i) => _tabButton(_tabs[i], i),
              ),
            ),
          ),
        ),
      ),
      body: IndexedStack(
        index: _selectedTab,
        children: [
          _buildChatTab(),
          _buildCalendarTab(),
          _buildExtensionsTab(),
          _buildFormatsTab(),
          _buildCalculationsTab(),
        ],
      ),
    );
  }

  // ─── TAB 1: Chat UI ───────────────────────────────────────────────────────
  Widget _buildChatTab() {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
      itemCount: _messages.length,
      itemBuilder: (context, index) {
        final msg = _messages[index];
        final isMe = msg['isMe'] as bool;
        final time = msg['time'] as DateTime;

        return Align(
          alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 4),
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.72,
            ),
            decoration: BoxDecoration(
              color: isMe ? Colors.indigo : Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(16),
                topRight: const Radius.circular(16),
                bottomLeft: Radius.circular(isMe ? 16 : 4),
                bottomRight: Radius.circular(isMe ? 4 : 16),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.06),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            child: Column(
              crossAxisAlignment: isMe
                  ? CrossAxisAlignment.end
                  : CrossAxisAlignment.start,
              children: [
                if (!isMe)
                  Text(
                    msg['sender'] as String,
                    style: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      color: Colors.indigo,
                    ),
                  ),
                const SizedBox(height: 2),
                Text(
                  msg['text'] as String,
                  style: TextStyle(
                    color: isMe ? Colors.white : Colors.black87,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  time.timeAgo,
                  style: TextStyle(
                    fontSize: 10,
                    color: isMe
                        ? Colors.white.withValues(alpha: 0.7)
                        : Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // ─── TAB 2: Calendar ──────────────────────────────────────────────────────
  Widget _buildCalendarTab() {
    final dates = [
      DateTime.now(),
      DateTime.now().subtract(const Duration(days: 1)),
      DateTime.now().add(const Duration(days: 1)),
      DateTime.now().add(const Duration(days: 3)),
      DateTime.now().subtract(const Duration(days: 3)),
      DateTime.now().subtract(const Duration(days: 8)),
      DateTime.now().subtract(const Duration(days: 35)),
      DateTime(2023, 12, 25),
      DateTime(2022, 1, 1),
    ];

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _sectionHeader('calendar & shortTimestamp'),
        const SizedBox(height: 12),
        ...dates.map(
          (date) => Card(
            margin: const EdgeInsets.only(bottom: 10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              leading: Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: Colors.indigo.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    '${date.day}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.indigo,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              title: Text(
                date.calendar,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
              subtitle: Text(
                date.shortTimestamp,
                style: const TextStyle(color: Colors.grey, fontSize: 12),
              ),
              trailing: Text(
                '${date.day}/${date.month}/${date.year}',
                style: const TextStyle(fontSize: 11, color: Colors.grey),
              ),
            ),
          ),
        ),
      ],
    );
  }

  // ─── TAB 3: Boolean Extensions ────────────────────────────────────────────
  Widget _buildExtensionsTab() {
    final testDates = [
      {'label': 'DateTime.now()', 'date': DateTime.now()},
      {
        'label': '1 hour ago',
        'date': DateTime.now().subtract(const Duration(hours: 1)),
      },
      {
        'label': 'Tomorrow',
        'date': DateTime.now().add(const Duration(days: 1)),
      },
      {
        'label': 'Yesterday',
        'date': DateTime.now().subtract(const Duration(days: 1)),
      },
      {'label': 'Year 2099', 'date': DateTime(2099, 1, 1)},
      {'label': 'Year 2000', 'date': DateTime(2000, 6, 15)},
    ];

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _sectionHeader('Boolean & utility extensions'),
        const SizedBox(height: 12),
        ...testDates.map((item) {
          final date = item['date'] as DateTime;
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item['label'] as String,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.indigo,
                    ),
                  ),
                  const Divider(height: 16),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      _chip('isToday', date.isToday),
                      _chip('isYesterday', date.isYesterday),
                      _chip('isTomorrow', date.isTomorrow),
                      _chip('isPast', date.isPast),
                      _chip('isFuture', date.isFuture),
                      _chip('isWeekend', date.isWeekend),
                      _chip('isWeekday', date.isWeekday),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Start of day: ${date.startOfDay}',
                    style: const TextStyle(fontSize: 11, color: Colors.grey),
                  ),
                  Text(
                    'End of day:   ${date.endOfDay}',
                    style: const TextStyle(fontSize: 11, color: Colors.grey),
                  ),
                  Text(
                    'Start of week: ${date.startOfWeek.format('EEE, dd MMM')}',
                    style: const TextStyle(fontSize: 11, color: Colors.grey),
                  ),
                  Text(
                    'End of week:   ${date.endOfWeek.format('EEE, dd MMM')}',
                    style: const TextStyle(fontSize: 11, color: Colors.grey),
                  ),
                  Text(
                    'Start of month: ${date.startOfMonth.format('dd MMM yyyy')}',
                    style: const TextStyle(fontSize: 11, color: Colors.grey),
                  ),
                  Text(
                    'End of month:   ${date.endOfMonth.format('dd MMM yyyy')}',
                    style: const TextStyle(fontSize: 11, color: Colors.grey),
                  ),
                ],
              ),
            ),
          );
        }),
      ],
    );
  }

  // ─── TAB 4: Formats (0.1.0) ───────────────────────────────────────────────
  Widget _buildFormatsTab() {
    final date = DateTime.now();

    final formats = [
      {'label': 'format(\'dd-MM-yyyy\')', 'value': date.format('dd-MM-yyyy')},
      {'label': 'format(\'MM/dd/yyyy\')', 'value': date.format('MM/dd/yyyy')},
      {
        'label': 'format(\'MMM dd, yyyy\')',
        'value': date.format('MMM dd, yyyy'),
      },
      {
        'label': 'format(\'MMMM dd, yyyy\')',
        'value': date.format('MMMM dd, yyyy'),
      },
      {'label': 'format(\'EEEE\')', 'value': date.format('EEEE')},
      {'label': 'format(\'EEE\')', 'value': date.format('EEE')},
      {'label': 'format(\'dd MMM yy\')', 'value': date.format('dd MMM yy')},
      {'label': 'format(\'hh:mm a\')', 'value': date.format('hh:mm a')},
      {'label': 'format(\'HH:mm:ss\')', 'value': date.format('HH:mm:ss')},
      {
        'label': 'format(\'EEEE, dd MMMM yyyy\')',
        'value': date.format('EEEE, dd MMMM yyyy'),
      },
      {'label': 'toReadable', 'value': date.toReadable},
      {'label': 'toISO', 'value': date.toISO},
      {'label': 'toTimeString', 'value': date.toTimeString},
      {'label': 'to12Hour', 'value': date.to12Hour},
      {'label': 'to24Hour', 'value': date.to24Hour},
      // Company format — the one from real project!
      {
        'label': 'format(\'dd-MM-yyyy\') ← company format',
        'value': date.format('dd-MM-yyyy'),
      },
    ];

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _sectionHeader('Custom Format Patterns — v0.1.0'),
        const SizedBox(height: 4),
        Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.only(bottom: 12),
          decoration: BoxDecoration(
            color: Colors.indigo.withValues(alpha: 0.08),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            'Reference date: ${date.toReadable}\n${date.toISO}',
            style: const TextStyle(
              fontSize: 12,
              color: Colors.indigo,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        ...formats.map(
          (f) => Card(
            margin: const EdgeInsets.only(bottom: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              dense: true,
              title: Text(
                f['label']!,
                style: const TextStyle(
                  fontSize: 12,
                  fontFamily: 'monospace',
                  color: Colors.indigo,
                  fontWeight: FontWeight.w600,
                ),
              ),
              trailing: Text(
                f['value']!,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  // ─── TAB 5: Calculations (0.5.0) ──────────────────────────────────────────
  Widget _buildCalculationsTab() {
    final now = DateTime.now();
    final birthDate = DateTime(1999, 5, 20);
    final deadline = now.add(const Duration(days: 15));
    final projectStart = now.subtract(const Duration(days: 30));
    final nextRelease = now.addWorkingDays(10);
    final eventDate = DateTime(now.year, 12, 31);

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _sectionHeader('Date Calculations & Range — v0.5.0'),
        const SizedBox(height: 12),

        // Age Calculator
        _calcCard(
          icon: '🎂',
          title: 'Age Calculator',
          color: Colors.purple,
          children: [
            _calcRow('Birth date', birthDate.format('dd MMMM yyyy')),
            _calcRow('Age today', '${birthDate.age} years old'),
            _calcRow(
              'Days since born',
              '${birthDate.daysUntil(now) * -1} days',
            ),
          ],
        ),

        // Working Days
        _calcCard(
          icon: '💼',
          title: 'Working Days',
          color: Colors.teal,
          children: [
            _calcRow('Today', now.format('EEE, dd MMM')),
            _calcRow(
              'Next release (+10 working days)',
              nextRelease.format('EEE, dd MMM yyyy'),
            ),
            _calcRow(
              'Working days until deadline',
              '${now.workingDaysUntil(deadline)} days',
            ),
            _calcRow(
              'Working days since project start',
              '${projectStart.workingDaysUntil(now)} days',
            ),
            _calcRow('Today is weekend?', now.isWeekend ? '✅ Yes' : '❌ No'),
            _calcRow('Today is weekday?', now.isWeekday ? '✅ Yes' : '❌ No'),
          ],
        ),

        // Days Until
        _calcCard(
          icon: '⏳',
          title: 'Days Until / Since',
          color: Colors.orange,
          children: [
            _calcRow(
              'Days until New Year\'s Eve',
              '${now.daysUntil(eventDate)} days',
            ),
            _calcRow(
              'Days since project started',
              '${now.daysSince(projectStart)} days',
            ),
            _calcRow('Days until deadline', '${now.daysUntil(deadline)} days'),
          ],
        ),

        // Range Helpers
        _calcCard(
          icon: '📆',
          title: 'Week & Month Range',
          color: Colors.green,
          children: [
            _calcRow('Start of week', now.startOfWeek.format('EEE, dd MMM')),
            _calcRow('End of week', now.endOfWeek.format('EEE, dd MMM')),
            _calcRow('Start of month', now.startOfMonth.format('dd MMM yyyy')),
            _calcRow('End of month', now.endOfMonth.format('dd MMM yyyy')),
            _calcRow('Start of year', now.startOfYear.format('dd MMM yyyy')),
            _calcRow('End of year', now.endOfYear.format('dd MMM yyyy')),
          ],
        ),

        // isBetween
        _calcCard(
          icon: '🎯',
          title: 'Range Check — isBetween',
          color: Colors.indigo,
          children: [
            _calcRow(
              'Range',
              '${projectStart.format('dd MMM')} → ${deadline.format('dd MMM')}',
            ),
            _calcRow(
              'Is today in range?',
              now.isBetween(projectStart, deadline) ? '✅ Yes' : '❌ No',
            ),
            _calcRow(
              'Is New Year in range?',
              eventDate.isBetween(projectStart, deadline) ? '✅ Yes' : '❌ No',
            ),
          ],
        ),

        // DB Query Example
        _calcCard(
          icon: '🗄️',
          title: 'Database Query Ranges',
          color: Colors.blueGrey,
          children: [
            _calcRow('Today start', now.startOfDay.toISO),
            _calcRow('Today end', now.endOfDay.toISO),
            _calcRow('Week start', now.startOfWeek.toISO),
            _calcRow('Week end', now.endOfWeek.toISO),
            _calcRow('Month start', now.startOfMonth.toISO),
            _calcRow('Month end', now.endOfMonth.toISO),
          ],
        ),
      ],
    );
  }

  // ─── Helpers ──────────────────────────────────────────────────────────────

  Widget _sectionHeader(String title) => Text(
    title,
    style: const TextStyle(
      fontSize: 13,
      color: Colors.grey,
      fontWeight: FontWeight.w600,
    ),
  );

  Widget _calcCard({
    required String icon,
    required String title,
    required Color color,
    required List<Widget> children,
  }) => Card(
    margin: const EdgeInsets.only(bottom: 14),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
    child: Padding(
      padding: const EdgeInsets.all(14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(icon, style: const TextStyle(fontSize: 20)),
              const SizedBox(width: 8),
              Text(
                title,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
            ],
          ),
          const Divider(height: 16),
          ...children,
        ],
      ),
    ),
  );

  Widget _calcRow(String label, String value) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 4),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Text(
            label,
            style: const TextStyle(fontSize: 12, color: Colors.grey),
          ),
        ),
        const SizedBox(width: 8),
        Flexible(
          child: Text(
            value,
            textAlign: TextAlign.right,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
        ),
      ],
    ),
  );

  Widget _chip(String label, bool value) => Chip(
    label: Text(
      '$label: $value',
      style: TextStyle(
        fontSize: 11,
        color: value ? Colors.green.shade800 : Colors.red.shade800,
        fontWeight: FontWeight.w500,
      ),
    ),
    backgroundColor: value
        ? Colors.green.withValues(alpha: 0.1)
        : Colors.red.withValues(alpha: 0.1),
    side: BorderSide(
      color: value ? Colors.green.shade200 : Colors.red.shade200,
    ),
    padding: EdgeInsets.zero,
    visualDensity: VisualDensity.compact,
  );

  Widget _tabButton(String label, int index) => GestureDetector(
    onTap: () => setState(() => _selectedTab = index),
    child: Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: _selectedTab == index ? Colors.white : Colors.transparent,
            width: 2.5,
          ),
        ),
      ),
      child: Text(
        label,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: _selectedTab == index ? Colors.white : Colors.white60,
          fontSize: 12,
          fontWeight: _selectedTab == index
              ? FontWeight.bold
              : FontWeight.normal,
        ),
      ),
    ),
  );
}
