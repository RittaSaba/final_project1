class Task1 {
  final int id;
  final int type_id;
  final String task_name;
  final String description;
  final DateTime start_date;
  final DateTime end_date;
  final String status;
  final int status_value;
  final String user_first_name;

  final String user_last_name;
  final String case_number;

  Task1({
    required this.id,
    required this.task_name,
    required this.description,
    required this.start_date,
    required this.end_date,
    required this.status,
    required this.status_value,
    required this.user_first_name,
    required this.user_last_name,
    required this.case_number,
    required this.type_id,
  });
}
