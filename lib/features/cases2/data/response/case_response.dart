class CaseResponse {
  CaseResponse({
    required this.id,required this.title,required this.facts,required this.legalDiscussion,required this.idCases
  });

  final  int id;
  final String title;
  final String facts;
  final String legalDiscussion;
  final int idCases;


  factory CaseResponse.fromJson(Map<String, dynamic> json){
    return CaseResponse(
      id: json['id'],
      title: json['title'],
      facts: json['facts'],
      legalDiscussion: json['legal_discussion'],
      idCases: json['id_cases'],
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'facts': facts,
    'legal_discussion': legalDiscussion,
    'id_cases': idCases,
  };

}
