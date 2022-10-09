class BestScore {
  int? id;
  int? bestScore;


  BestScore({this.id, this.bestScore });

  BestScore.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bestScore = json[bestScore];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['bestScore'] = this.bestScore;

    return data;
  }

}
