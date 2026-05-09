import 'package:flutter/material.dart';
import 'package:smart_date_formatter/smart_date_formatter.dart';

void main() => runApp(const SmartDateDemoApp());

class SmartDateDemoApp extends StatelessWidget {
  const SmartDateDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'smart_date_formatter Playground',
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
  int _selectedTab = 0;

  final List<Map<String, String>> _tabs = [
    {'icon': '💬', 'label': 'Chat'},
    {'icon': '📅', 'label': 'Calendar'},
    {'icon': '🔌', 'label': 'Extensions'},
    {'icon': '🎨', 'label': 'Formats'},
    {'icon': '🧮', 'label': 'Calculations'},
    {'icon': '🌍', 'label': 'Localization'},
    {'icon': '🔍', 'label': 'Parser'},
    {'icon': '⏱️', 'label': 'TimeAgo'},
    {'icon': '⏳', 'label': 'Countdown'},
    {'icon': '🗄️', 'label': 'Ranges'},
  ];

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'smart_date_formatter',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              'Interactive Playground v1.0.0',
              style: TextStyle(fontSize: 11, color: Colors.white70),
            ),
          ],
        ),
        actions: [
          TextButton.icon(
            onPressed: () => _launchUrl('https://pub.dev/packages/smart_date_formatter'),
            icon: const Icon(Icons.open_in_new, color: Colors.white70, size: 14),
            label: const Text('pub.dev',
                style: TextStyle(color: Colors.white70, fontSize: 12)),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(48),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                _tabs.length,
                (i) => _tabButton(
                  '${_tabs[i]['icon']} ${_tabs[i]['label']}',
                  i,
                ),
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
          _buildLocalizationTab(),
          _buildParserTab(),
          _buildTimeAgoWidgetTab(),
          _buildCountdownTab(),
          _buildRangesTab(),
        ],
      ),
    );
  }

  // ─── TAB 1: Chat ──────────────────────────────────────────────────────────
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
                maxWidth: MediaQuery.of(context).size.width * 0.72),
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
              crossAxisAlignment:
                  isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
              children: [
                if (!isMe)
                  Text(msg['sender'] as String,
                      style: const TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          color: Colors.indigo)),
                const SizedBox(height: 2),
                Text(msg['text'] as String,
                    style: TextStyle(
                        color: isMe ? Colors.white : Colors.black87,
                        fontSize: 14)),
                const SizedBox(height: 4),
                // ✅ timeAgo extension
                Text(time.timeAgo,
                    style: TextStyle(
                        fontSize: 10,
                        color: isMe
                            ? Colors.white.withValues(alpha: 0.7)
                            : Colors.grey)),
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
        ...dates.map((date) => Card(
              margin: const EdgeInsets.only(bottom: 10),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              child: ListTile(
                leading: _dayCircle(date),
                // ✅ calendar extension
                title: Text(date.calendar,
                    style: const TextStyle(fontWeight: FontWeight.w600)),
                // ✅ shortTimestamp extension
                subtitle: Text(date.shortTimestamp,
                    style:
                        const TextStyle(color: Colors.grey, fontSize: 12)),
                trailing: Text('${date.day}/${date.month}/${date.year}',
                    style:
                        const TextStyle(fontSize: 11, color: Colors.grey)),
              ),
            )),
      ],
    );
  }

  // ─── TAB 3: Extensions ────────────────────────────────────────────────────
  Widget _buildExtensionsTab() {
    final testDates = [
      {'label': 'DateTime.now()', 'date': DateTime.now()},
      {'label': '1 hour ago', 'date': DateTime.now().subtract(const Duration(hours: 1))},
      {'label': 'Tomorrow', 'date': DateTime.now().add(const Duration(days: 1))},
      {'label': 'Yesterday', 'date': DateTime.now().subtract(const Duration(days: 1))},
      {'label': 'Year 2099', 'date': DateTime(2099, 1, 1)},
      {'label': 'Year 2000', 'date': DateTime(2000, 6, 15)},
      {'label': 'Saturday', 'date': DateTime(2024, 6, 22)},
      {'label': 'Monday', 'date': DateTime(2024, 6, 17)},
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
                borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item['label'] as String,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.indigo)),
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
                  Text('startOfWeek: ${date.startOfWeek.format('EEE dd MMM')}',
                      style: const TextStyle(fontSize: 11, color: Colors.grey)),
                  Text('endOfWeek:   ${date.endOfWeek.format('EEE dd MMM')}',
                      style: const TextStyle(fontSize: 11, color: Colors.grey)),
                  Text('startOfMonth: ${date.startOfMonth.format('dd MMM yyyy')}',
                      style: const TextStyle(fontSize: 11, color: Colors.grey)),
                  Text('endOfMonth:   ${date.endOfMonth.format('dd MMM yyyy')}',
                      style: const TextStyle(fontSize: 11, color: Colors.grey)),
                ],
              ),
            ),
          );
        }),
      ],
    );
  }

  // ─── TAB 4: Formats ───────────────────────────────────────────────────────
  Widget _buildFormatsTab() {
    final date = DateTime.now();
    final formats = [
      {'label': "format('dd-MM-yyyy')", 'value': date.format('dd-MM-yyyy')},
      {'label': "format('MM/dd/yyyy')", 'value': date.format('MM/dd/yyyy')},
      {'label': "format('MMM dd, yyyy')", 'value': date.format('MMM dd, yyyy')},
      {'label': "format('MMMM dd, yyyy')", 'value': date.format('MMMM dd, yyyy')},
      {'label': "format('EEEE')", 'value': date.format('EEEE')},
      {'label': "format('EEE, dd MMM yy')", 'value': date.format('EEE, dd MMM yy')},
      {'label': "format('hh:mm a')", 'value': date.format('hh:mm a')},
      {'label': "format('HH:mm:ss')", 'value': date.format('HH:mm:ss')},
      {'label': "format('EEEE, dd MMMM yyyy')", 'value': date.format('EEEE, dd MMMM yyyy')},
      {'label': 'toReadable', 'value': date.toReadable},
      {'label': 'toISO', 'value': date.toISO},
      {'label': 'toTimeString', 'value': date.toTimeString},
      {'label': 'to12Hour', 'value': date.to12Hour},
      {'label': 'to24Hour', 'value': date.to24Hour},
    ];
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _sectionHeader('Custom Format Patterns — v0.1.0'),
        const SizedBox(height: 4),
        _infoBox('Reference: ${date.toReadable}\n${date.toISO}'),
        const SizedBox(height: 12),
        ...formats.map((f) => Card(
              margin: const EdgeInsets.only(bottom: 8),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: ListTile(
                dense: true,
                title: Text(f['label']!,
                    style: const TextStyle(
                        fontSize: 12,
                        fontFamily: 'monospace',
                        color: Colors.indigo,
                        fontWeight: FontWeight.w600)),
                trailing: Text(f['value']!,
                    style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87)),
              ),
            )),
      ],
    );
  }

  // ─── TAB 5: Calculations ──────────────────────────────────────────────────
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
        _calcCard(icon: '🎂', title: 'Age Calculator', color: Colors.purple,
            children: [
              _calcRow('Birth date', birthDate.format('dd MMMM yyyy')),
              _calcRow('Age today', '${birthDate.age} years old'),
              _calcRow('Days since born', '${birthDate.daysUntil(now) * -1} days'),
            ]),
        _calcCard(icon: '💼', title: 'Working Days', color: Colors.teal,
            children: [
              _calcRow('Today', now.format('EEE, dd MMM')),
              _calcRow('+10 working days', nextRelease.format('EEE, dd MMM yyyy')),
              _calcRow('Working days until deadline', '${now.workingDaysUntil(deadline)} days'),
              _calcRow('Working days since project start', '${projectStart.workingDaysUntil(now)} days'),
              _calcRow('Today is weekend?', now.isWeekend ? '✅ Yes' : '❌ No'),
              _calcRow('Today is weekday?', now.isWeekday ? '✅ Yes' : '❌ No'),
            ]),
        _calcCard(icon: '⏳', title: 'Days Until / Since', color: Colors.orange,
            children: [
              _calcRow('Days until New Year\'s Eve', '${now.daysUntil(eventDate)} days'),
              _calcRow('Days since project started', '${now.daysSince(projectStart)} days'),
              _calcRow('Days until deadline', '${now.daysUntil(deadline)} days'),
            ]),
        _calcCard(icon: '📆', title: 'Week & Month Range', color: Colors.green,
            children: [
              _calcRow('Start of week', now.startOfWeek.format('EEE, dd MMM')),
              _calcRow('End of week', now.endOfWeek.format('EEE, dd MMM')),
              _calcRow('Start of month', now.startOfMonth.format('dd MMM yyyy')),
              _calcRow('End of month', now.endOfMonth.format('dd MMM yyyy')),
              _calcRow('Start of year', now.startOfYear.format('dd MMM yyyy')),
              _calcRow('End of year', now.endOfYear.format('dd MMM yyyy')),
            ]),
        _calcCard(icon: '🎯', title: 'isBetween Range Check', color: Colors.indigo,
            children: [
              _calcRow('Range', '${projectStart.format('dd MMM')} → ${deadline.format('dd MMM')}'),
              _calcRow('Is today in range?', now.isBetween(projectStart, deadline) ? '✅ Yes' : '❌ No'),
              _calcRow('Is New Year in range?', eventDate.isBetween(projectStart, deadline) ? '✅ Yes' : '❌ No'),
            ]),
      ],
    );
  }

  // ─── TAB 6: Localization ──────────────────────────────────────────────────
  Widget _buildLocalizationTab() {
    final date2h = DateTime.now().subtract(const Duration(hours: 2));
    final date1d = DateTime.now().subtract(const Duration(days: 1));
    final date1w = DateTime.now().subtract(const Duration(days: 8));

    final locales = [
      {'locale': SdfLocale.en, 'flag': '🇬🇧', 'name': 'English'},
      {'locale': SdfLocale.hi, 'flag': '🇮🇳', 'name': 'Hindi'},
      {'locale': SdfLocale.es, 'flag': '🇪🇸', 'name': 'Spanish'},
      {'locale': SdfLocale.fr, 'flag': '🇫🇷', 'name': 'French'},
      {'locale': SdfLocale.ja, 'flag': '🇯🇵', 'name': 'Japanese'},
      {'locale': SdfLocale.ar, 'flag': '🇸🇦', 'name': 'Arabic'},
    ];

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _sectionHeader('Multi-language Support — v0.9.0'),
        const SizedBox(height: 4),
        _infoBox('SdfLocale.supported: ${SdfLocale.supported.join(', ')}'),
        const SizedBox(height: 12),
        ...locales.map((l) {
          final locale = l['locale'] as SdfLocale;
          final fmt = SmartDateFormatter(locale: locale);
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(children: [
                    Text(l['flag'] as String,
                        style: const TextStyle(fontSize: 22)),
                    const SizedBox(width: 8),
                    Text(l['name'] as String,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.indigo)),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                        color: Colors.indigo.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text('locale: ${locale.code}',
                          style: const TextStyle(
                              fontSize: 11,
                              color: Colors.indigo,
                              fontFamily: 'monospace')),
                    ),
                  ]),
                  const Divider(height: 16),
                  // ✅ timeAgoIn extension
                  _calcRow('2 hours ago', date2h.timeAgoIn(locale)),
                  _calcRow('Yesterday', fmt.format(date1d)),
                  _calcRow('Last week', fmt.format(date1w)),
                ],
              ),
            ),
          );
        }),
      ],
    );
  }

  // ─── TAB 7: SmartParser ───────────────────────────────────────────────────
  Widget _buildParserTab() {
    final expressions = [
      'today', 'tomorrow', 'yesterday',
      'in 3 days', 'in 2 weeks', 'in 1 month', 'in 1 year',
      '3 days ago', '2 weeks ago', '1 month ago',
      'next monday', 'last friday', 'next week',
      'last week', 'next month', 'last year',
      '2024-06-15',
    ];

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _sectionHeader('SmartParser — Natural Language → DateTime — v0.9.0'),
        const SizedBox(height: 4),
        _infoBox('SmartParser.parse("tomorrow") → DateTime'),
        const SizedBox(height: 12),
        ...expressions.map((expr) {
          final result = SmartParser.parse(expr);
          final canParse = SmartParser.canParse(expr);
          return Card(
            margin: const EdgeInsets.only(bottom: 8),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)),
            child: ListTile(
              dense: true,
              leading: Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: canParse
                      ? Colors.green.withValues(alpha: 0.1)
                      : Colors.red.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  canParse ? Icons.check : Icons.close,
                  color: canParse ? Colors.green : Colors.red,
                  size: 16,
                ),
              ),
              title: Text('"$expr"',
                  style: const TextStyle(
                      fontFamily: 'monospace',
                      color: Colors.indigo,
                      fontWeight: FontWeight.w600,
                      fontSize: 13)),
              trailing: result != null
                  ? Text(result.format('dd MMM yyyy'),
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          color: Colors.black87))
                  : const Text('null',
                      style: TextStyle(color: Colors.red)),
            ),
          );
        }),

        const SizedBox(height: 16),
        _sectionHeader('Live Parser — Type and Parse!'),
        const SizedBox(height: 8),
        const _LiveParserWidget(),
      ],
    );
  }

  // ─── TAB 8: TimeAgoText Widget ────────────────────────────────────────────
  Widget _buildTimeAgoWidgetTab() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _sectionHeader('TimeAgoText Widget — Auto Refreshing — v1.0.0'),
        const SizedBox(height: 4),
        _infoBox('Widget auto-updates without setState or Timer management!'),
        const SizedBox(height: 12),

        // Demo cards
        _timeAgoCard(
          title: 'Just now',
          date: DateTime.now().subtract(const Duration(seconds: 5)),
          locale: SdfLocale.en,
          refreshRate: const Duration(seconds: 5),
          color: Colors.green,
        ),
        _timeAgoCard(
          title: '2 minutes ago',
          date: DateTime.now().subtract(const Duration(minutes: 2)),
          locale: SdfLocale.en,
          color: Colors.blue,
        ),
        _timeAgoCard(
          title: 'Hindi — 3 ghante pehle',
          date: DateTime.now().subtract(const Duration(hours: 3)),
          locale: SdfLocale.hi,
          color: Colors.orange,
        ),
        _timeAgoCard(
          title: 'Spanish — ayer',
          date: DateTime.now().subtract(const Duration(days: 1)),
          locale: SdfLocale.es,
          color: Colors.purple,
        ),
        _timeAgoCard(
          title: 'Japanese — 先週',
          date: DateTime.now().subtract(const Duration(days: 8)),
          locale: SdfLocale.ja,
          color: Colors.red,
        ),
        _timeAgoCard(
          title: 'With prefix — "Posted "',
          date: DateTime.now().subtract(const Duration(minutes: 30)),
          locale: SdfLocale.en,
          prefix: 'Posted ',
          color: Colors.teal,
        ),

        const SizedBox(height: 16),
        _sectionHeader('Code Example'),
        const SizedBox(height: 8),
        _codeBlock('''TimeAgoText(
  date: message.sentAt,
  locale: SdfLocale.hi,
  refreshRate: Duration(seconds: 30),
  prefix: 'Sent ',
  style: TextStyle(
    color: Colors.grey,
    fontSize: 12,
  ),
)'''),
      ],
    );
  }

  Widget _timeAgoCard({
    required String title,
    required DateTime date,
    required SdfLocale locale,
    required Color color,
    Duration refreshRate = const Duration(seconds: 60),
    String prefix = '',
  }) =>
      Card(
        margin: const EdgeInsets.only(bottom: 12),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Row(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(Icons.access_time, color: color, size: 22),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title,
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 13,
                            color: color)),
                    const SizedBox(height: 4),
                    // ✅ TimeAgoText widget
                    TimeAgoText(
                      date: date,
                      locale: locale,
                      refreshRate: refreshRate,
                      prefix: prefix,
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    Text('locale: ${locale.code}  •  refresh: ${refreshRate.inSeconds}s',
                        style: const TextStyle(
                            fontSize: 10, color: Colors.grey)),
                  ],
                ),
              ),
            ],
          ),
        ),
      );

  // ─── TAB 9: Countdown ─────────────────────────────────────────────────────
  Widget _buildCountdownTab() {
    final now = DateTime.now();
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _sectionHeader('CountdownText Widget — Live Countdown — v1.0.0'),
        const SizedBox(height: 4),
        _infoBox('Auto counts down every second. onFinished callback supported!'),
        const SizedBox(height: 12),

        // New Year countdown
        _countdownCard(
          title: '🎉 New Year\'s Eve',
          subtitle: 'Dec 31 ${now.year}',
          target: DateTime(now.year, 12, 31, 23, 59, 59),
          format: '{d}d {h}h {m}m {s}s',
          color: Colors.indigo,
        ),

        // End of month
        _countdownCard(
          title: '📅 End of Month',
          subtitle: now.endOfMonth.format('dd MMM yyyy'),
          target: now.endOfMonth,
          format: '{d}d {h}h {m}m',
          color: Colors.teal,
        ),

        // Flash sale — 2 hours from now
        _countdownCard(
          title: '⚡ Flash Sale Ends',
          subtitle: 'In 2 hours from now',
          target: now.add(const Duration(hours: 2)),
          format: '{hh}:{mm}:{ss}',
          color: Colors.red,
        ),

        // Meeting in 30 mins
        _countdownCard(
          title: '📞 Meeting Starts',
          subtitle: 'In 30 minutes',
          target: now.add(const Duration(minutes: 30)),
          format: '{mm}m {ss}s',
          color: Colors.orange,
        ),

        // End of day
        _countdownCard(
          title: '🌙 End of Day',
          subtitle: now.endOfDay.format('dd MMM yyyy HH:mm'),
          target: now.endOfDay,
          format: '{h}h {mm}m {ss}s',
          color: Colors.purple,
        ),

        const SizedBox(height: 16),
        _sectionHeader('Code Example'),
        const SizedBox(height: 8),
        _codeBlock('''CountdownText(
  target: saleEndsAt,
  format: '{hh}:{mm}:{ss}',
  finishedText: 'Sale Ended!',
  style: TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Colors.red,
  ),
  onFinished: () => hideSaleBanner(),
)'''),
      ],
    );
  }

  Widget _countdownCard({
    required String title,
    required String subtitle,
    required DateTime target,
    required String format,
    required Color color,
  }) =>
      Card(
        margin: const EdgeInsets.only(bottom: 12),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: color)),
                    Text(subtitle,
                        style: const TextStyle(
                            fontSize: 11, color: Colors.grey)),
                    const SizedBox(height: 8),
                    // ✅ CountdownText widget
                    CountdownText(
                      target: target,
                      format: format,
                      finishedText: '🎉 Done!',
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: color,
                          fontFeatures: const [
                            FontFeature.tabularFigures()
                          ]),
                    ),
                    Text('format: "$format"',
                        style: const TextStyle(
                            fontSize: 10,
                            color: Colors.grey,
                            fontFamily: 'monospace')),
                  ],
                ),
              ),
            ],
          ),
        ),
      );

  // ─── TAB 10: DateRangeHelper ──────────────────────────────────────────────
  Widget _buildRangesTab() {
    final now = DateTime.now();
    final ranges = [
      {'label': 'today()', 'range': DateRangeHelper.today()},
      {'label': 'yesterday()', 'range': DateRangeHelper.yesterday()},
      {'label': 'tomorrow()', 'range': DateRangeHelper.tomorrow()},
      {'label': 'thisWeek()', 'range': DateRangeHelper.thisWeek()},
      {'label': 'lastWeek()', 'range': DateRangeHelper.lastWeek()},
      {'label': 'nextWeek()', 'range': DateRangeHelper.nextWeek()},
      {'label': 'thisMonth()', 'range': DateRangeHelper.thisMonth()},
      {'label': 'lastMonth()', 'range': DateRangeHelper.lastMonth()},
      {'label': 'nextMonth()', 'range': DateRangeHelper.nextMonth()},
      {'label': 'thisYear()', 'range': DateRangeHelper.thisYear()},
      {'label': 'lastYear()', 'range': DateRangeHelper.lastYear()},
      {'label': 'lastNDays(7)', 'range': DateRangeHelper.lastNDays(7)},
      {'label': 'lastNDays(30)', 'range': DateRangeHelper.lastNDays(30)},
      {'label': 'nextNDays(14)', 'range': DateRangeHelper.nextNDays(14)},
      {'label': 'quarter(1)', 'range': DateRangeHelper.quarter(1)},
      {'label': 'quarter(2)', 'range': DateRangeHelper.quarter(2)},
      {'label': 'quarter(3)', 'range': DateRangeHelper.quarter(3)},
      {'label': 'quarter(4)', 'range': DateRangeHelper.quarter(4)},
      {'label': 'currentQuarter()', 'range': DateRangeHelper.currentQuarter()},
    ];

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _sectionHeader('DateRangeHelper — DB Query Ranges — v1.0.0'),
        const SizedBox(height: 4),
        _infoBox(
            'Perfect for database queries, analytics filters, and calendar views.\n'
            'Today is: ${now.toReadable}'),
        const SizedBox(height: 12),
        ...ranges.map((r) {
          final range = r['range'] as DateRange;
          final containsToday = range.contains(now);
          return Card(
            margin: const EdgeInsets.only(bottom: 8),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'DateRangeHelper.${r['label']}',
                        style: const TextStyle(
                            fontFamily: 'monospace',
                            color: Colors.indigo,
                            fontWeight: FontWeight.w600,
                            fontSize: 12),
                      ),
                      if (containsToday)
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            color: Colors.green.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Text('contains today',
                              style: TextStyle(
                                  fontSize: 9,
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold)),
                        ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(Icons.arrow_forward,
                          size: 12, color: Colors.grey),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          '${range.start.format('dd MMM yyyy')} → ${range.end.format('dd MMM yyyy')}  •  ${range.days} days',
                          style: const TextStyle(
                              fontSize: 11, color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        }),

        const SizedBox(height: 16),
        _sectionHeader('Code Example — DB Query'),
        const SizedBox(height: 8),
        _codeBlock('''final range = DateRangeHelper.thisMonth();

// SQLite
final orders = await db.query(
  'orders',
  where: 'created_at BETWEEN ? AND ?',
  whereArgs: [
    range.start.toIso8601String(),
    range.end.toIso8601String(),
  ],
);

// Check
range.contains(DateTime.now());  // true
range.days;                       // 30
range.overlaps(otherRange);       // true/false'''),
      ],
    );
  }

  // ─── Shared Helpers ───────────────────────────────────────────────────────

  Widget _sectionHeader(String title) => Text(title,
      style: const TextStyle(
          fontSize: 13, color: Colors.grey, fontWeight: FontWeight.w600));

  Widget _infoBox(String text) => Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.indigo.withValues(alpha: 0.08),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(text,
            style: const TextStyle(fontSize: 12, color: Colors.indigo)),
      );

  Widget _codeBlock(String code) => Container(
        width: double.infinity,
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: const Color(0xFF1E1E2E),
          borderRadius: BorderRadius.circular(12),
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Text(code,
              style: const TextStyle(
                  fontFamily: 'monospace',
                  fontSize: 12,
                  color: Color(0xFFCDD6F4))),
        ),
      );

  Widget _calcCard({
    required String icon,
    required String title,
    required Color color,
    required List<Widget> children,
  }) =>
      Card(
        margin: const EdgeInsets.only(bottom: 14),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(children: [
                Text(icon, style: const TextStyle(fontSize: 20)),
                const SizedBox(width: 8),
                Text(title,
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: color)),
              ]),
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
                child: Text(label,
                    style: const TextStyle(
                        fontSize: 12, color: Colors.grey))),
            const SizedBox(width: 8),
            Flexible(
                child: Text(value,
                    textAlign: TextAlign.right,
                    style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87))),
          ],
        ),
      );

  Widget _chip(String label, bool value) => Chip(
        label: Text('$label: $value',
            style: TextStyle(
                fontSize: 11,
                color: value
                    ? Colors.green.shade800
                    : Colors.red.shade800,
                fontWeight: FontWeight.w500)),
        backgroundColor: value
            ? Colors.green.withValues(alpha: 0.1)
            : Colors.red.withValues(alpha: 0.1),
        side: BorderSide(
            color: value ? Colors.green.shade200 : Colors.red.shade200),
        padding: EdgeInsets.zero,
        visualDensity: VisualDensity.compact,
      );

  Widget _dayCircle(DateTime date) => Container(
        width: 44,
        height: 44,
        decoration: BoxDecoration(
          color: Colors.indigo.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text('${date.day}',
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo,
                  fontSize: 16)),
        ),
      );

  Widget _tabButton(String label, int index) => GestureDetector(
        onTap: () => setState(() => _selectedTab = index),
        child: Container(
          padding:
              const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: _selectedTab == index
                    ? Colors.white
                    : Colors.transparent,
                width: 2.5,
              ),
            ),
          ),
          child: Text(label,
              style: TextStyle(
                  color: _selectedTab == index
                      ? Colors.white
                      : Colors.white60,
                  fontSize: 12,
                  fontWeight: _selectedTab == index
                      ? FontWeight.bold
                      : FontWeight.normal)),
        ),
      );

  void _launchUrl(String url) {
    // Opens pub.dev link
    debugPrint('Opening: $url');
  }
}

// ─── Live Parser Widget ────────────────────────────────────────────────────
class _LiveParserWidget extends StatefulWidget {
  const _LiveParserWidget();

  @override
  State<_LiveParserWidget> createState() => _LiveParserWidgetState();
}

class _LiveParserWidgetState extends State<_LiveParserWidget> {
  final _controller = TextEditingController();
  DateTime? _result;
  bool _canParse = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _parse(String value) {
    setState(() {
      _result = SmartParser.parse(value);
      _canParse = SmartParser.canParse(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _controller,
              onChanged: _parse,
              decoration: InputDecoration(
                hintText: 'Type: tomorrow, next monday, in 3 days...',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8)),
                contentPadding: const EdgeInsets.symmetric(
                    horizontal: 12, vertical: 10),
                suffixIcon: _canParse
                    ? const Icon(Icons.check_circle, color: Colors.green)
                    : const Icon(Icons.cancel, color: Colors.red),
              ),
            ),
            const SizedBox(height: 12),
            if (_controller.text.isNotEmpty)
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: _canParse
                      ? Colors.green.withValues(alpha: 0.08)
                      : Colors.red.withValues(alpha: 0.08),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: _canParse
                        ? Colors.green.shade200
                        : Colors.red.shade200,
                  ),
                ),
                child: _canParse && _result != null
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('✅ Parsed successfully!',
                              style: TextStyle(
                                  color: Colors.green.shade700,
                                  fontWeight: FontWeight.bold)),
                          const SizedBox(height: 4),
                          Text('DateTime: ${_result!.toISO}',
                              style: const TextStyle(
                                  fontFamily: 'monospace', fontSize: 13)),
                          Text('calendar: ${_result!.calendar}',
                              style: const TextStyle(fontSize: 13)),
                          Text('timeAgo: ${_result!.timeAgo}',
                              style: const TextStyle(fontSize: 13)),
                        ],
                      )
                    : Text('❌ Cannot parse "${_controller.text}"',
                        style: TextStyle(color: Colors.red.shade700)),
              ),
          ],
        ),
      ),
    );
  }
}