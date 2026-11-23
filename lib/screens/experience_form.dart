import 'package:flutter/material.dart';
import 'package:myportofolio_mobile/widgets/left_drawer.dart';

class ExperienceFormPage extends StatefulWidget {
  const ExperienceFormPage({super.key});

  @override
  State<ExperienceFormPage> createState() => _ExperienceFormPageState();
}

class _ExperienceFormPageState extends State<ExperienceFormPage> {
  final _formKey = GlobalKey<FormState>();

  String _name = "";
  String _description = "";
  String _category = "Full-Time";
  String _thumbnailUrl = "";
  DateTime? _startDate;
  DateTime? _endDate;
  bool _isOngoing = false;

  final List<String> _categories = [
    'Full-Time',
    'Part-Time',
    'Internship',
    'Organization',
    'Committee',
    'Volunteer',
  ];

  // Format tanggal mm/dd/yyyy sesuai referensi web
  String _formatDate(DateTime date) {
    final month = date.month.toString().padLeft(2, '0');
    final day = date.day.toString().padLeft(2, '0');
    final year = date.year.toString();
    return '$month/$day/$year';
  }

  Future<void> _pickDate({required bool isStart}) async {
    final initialDate = isStart
        ? (_startDate ?? DateTime.now())
        : (_endDate ?? _startDate ?? DateTime.now());

    final picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(2015),
      lastDate: DateTime(2035),
    );

    if (picked != null) {
      setState(() {
        if (isStart) {
          _startDate = picked;
        } else {
          _endDate = picked;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tambah Experience Baru',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
      ),
      drawer: const LeftDrawer(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. Nama Experience
              Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: "Nama Experience",
                    hintText: "Masukkan nama experience",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _name = value ?? "";
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Nama Experience tidak boleh kosong!";
                    }
                    if (value.trim().length < 3) {
                      return "Nama Experience minimal 3 karakter!";
                    }
                    return null;
                  },
                ),
              ),

              // 2. Deskripsi Experience
              Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: TextFormField(
                  maxLines: 4,
                  decoration: InputDecoration(
                    labelText: "Deskripsi Experience",
                    hintText: "Jelaskan detail pengalamanmu",
                    alignLabelWithHint: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _description = value ?? "";
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Deskripsi Experience tidak boleh kosong!";
                    }
                    if (value.trim().length < 10) {
                      return "Deskripsi Experience minimal 10 karakter!";
                    }
                    return null;
                  },
                ),
              ),

              // 3. Category Experience
              Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: DropdownButtonFormField<String>(
                  value: _category,
                  decoration: InputDecoration(
                    labelText: "Category Experience",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                  items: _categories.map((String item) {
                    return DropdownMenuItem<String>(
                      value: item,
                      child: Text(item),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _category = newValue!;
                    });
                  },
                ),
              ),

              // 4. URL Thumbnail
              Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: TextFormField(
                  keyboardType: TextInputType.url,
                  decoration: InputDecoration(
                    labelText: "URL Thumbnail",
                    hintText: "https://example.com/image.png",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _thumbnailUrl = value ?? "";
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.trim().isEmpty) {
                      return "URL Thumbnail tidak boleh kosong!";
                    }
                    final uri = Uri.tryParse(value.trim());
                    if (uri == null ||
                        !uri.hasAbsolutePath ||
                        (uri.scheme != 'http' && uri.scheme != 'https')) {
                      return "Masukkan format URL yang valid (http:// atau https://)!";
                    }
                    return null;
                  },
                ),
              ),

              // 5. Waktu Dimulai
              Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: FormField<DateTime>(
                  validator: (_) {
                    if (_startDate == null) {
                      return "Waktu Dimulai wajib dipilih!";
                    }
                    return null;
                  },
                  builder: (FormFieldState<DateTime> state) {
                    return InkWell(
                      onTap: () async {
                        await _pickDate(isStart: true);
                        state.didChange(_startDate);
                      },
                      borderRadius: BorderRadius.circular(12.0),
                      child: InputDecorator(
                        decoration: InputDecoration(
                          labelText: "Waktu Dimulai",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          suffixIcon: const Icon(Icons.calendar_today),
                          errorText: state.errorText,
                        ),
                        child: Text(
                          _startDate != null
                              ? _formatDate(_startDate!)
                              : "mm/dd/yyyy",
                          style: TextStyle(
                            color: _startDate != null
                                ? colorScheme.onSurface
                                : Colors.grey[600],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

              // 6. Waktu Berakhir
              Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: FormField<DateTime>(
                  validator: (_) {
                    if (!_isOngoing && _endDate == null) {
                      return "Waktu Berakhir wajib dipilih jika tidak On-going!";
                    }
                    if (!_isOngoing &&
                        _startDate != null &&
                        _endDate != null &&
                        _endDate!.isBefore(_startDate!)) {
                      return "Waktu Berakhir tidak boleh sebelum Waktu Dimulai!";
                    }
                    return null;
                  },
                  builder: (FormFieldState<DateTime> state) {
                    return InkWell(
                      onTap: _isOngoing
                          ? null
                          : () async {
                              await _pickDate(isStart: false);
                              state.didChange(_endDate);
                            },
                      borderRadius: BorderRadius.circular(12.0),
                      child: InputDecorator(
                        decoration: InputDecoration(
                          enabled: !_isOngoing,
                          labelText: "Waktu Berakhir",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          suffixIcon: const Icon(Icons.calendar_today),
                          errorText: state.errorText,
                        ),
                        child: Text(
                          _isOngoing
                              ? "Sedang berlangsung"
                              : (_endDate != null
                                  ? _formatDate(_endDate!)
                                  : "mm/dd/yyyy"),
                          style: TextStyle(
                            color: (!_isOngoing && _endDate != null)
                                ? colorScheme.onSurface
                                : Colors.grey[600],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

              // 7. On-going (Radio Yes / No)
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "On-going",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: colorScheme.onSurface,
                      ),
                    ),
                    Row(
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Radio<bool>(
                              value: true,
                              groupValue: _isOngoing,
                              onChanged: (bool? value) {
                                setState(() {
                                  _isOngoing = value ?? true;
                                  if (_isOngoing) {
                                    _endDate = null;
                                  }
                                });
                              },
                            ),
                            const Text("Yes"),
                          ],
                        ),
                        const SizedBox(width: 24.0),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Radio<bool>(
                              value: false,
                              groupValue: _isOngoing,
                              onChanged: (bool? value) {
                                setState(() {
                                  _isOngoing = value ?? false;
                                });
                              },
                            ),
                            const Text("No"),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Tombol Simpan
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: colorScheme.primary,
                    foregroundColor: colorScheme.onPrimary,
                    padding: const EdgeInsets.symmetric(vertical: 14.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Experience Berhasil Disimpan'),
                            content: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text('Nama: $_name'),
                                  Text('Deskripsi: $_description'),
                                  Text('Category: $_category'),
                                  Text('URL Thumbnail: $_thumbnailUrl'),
                                  Text(
                                    'Waktu Dimulai: ${_formatDate(_startDate!)}',
                                  ),
                                  Text(
                                    'Waktu Berakhir: ${_isOngoing ? "-" : _formatDate(_endDate!)}',
                                  ),
                                  Text('On-going: ${_isOngoing ? "Yes" : "No"}'),
                                ],
                              ),
                            ),
                            actions: [
                              TextButton(
                                child: const Text('OK'),
                                onPressed: () {
                                  Navigator.pop(context);
                                  _formKey.currentState!.reset();
                                  setState(() {
                                    _name = "";
                                    _description = "";
                                    _category = "Full-Time";
                                    _thumbnailUrl = "";
                                    _startDate = null;
                                    _endDate = null;
                                    _isOngoing = false;
                                  });
                                },
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                  child: const Text(
                    "Simpan",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}