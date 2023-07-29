import 'dart:convert';

import 'package:http/http.dart' as http;

getUser() async {
  var url = Uri.parse('https://jsonplaceholder.typicode.com/users');
  var response = await http.get(url);
  var data = jsonDecode(response.body);
  
  // print(data[0]['name']);
  
  // for(var user in data){
  //   print(user['name']);
  // }

  var usuario = data.map((json)=>modelUser.fromJson(json)).toList();

  for(var user in usuario){
    print(user.nome);
  }
  
}

getPost() async {
  var url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
  var response = await http.get(url);
  var data = jsonDecode(response.body);

  var posts = data.map((json)=>modelPost.fromJson(json)).toList();

  for(var post in posts){
    print(post.titulo);
  }
}

class modelPost{
  String titulo;
  String descricao;

  modelPost({
    required this.titulo,
    required this.descricao,
  });

  factory modelPost.fromJson(Map<String, dynamic>json){
    return modelPost(titulo: json['title'], descricao: json['body']);
  }

}

class modelUser{
  String nome;
  String email;
  String telefone;

  modelUser({
    required this.nome,
    required this.email,
    required this.telefone,
  });

  factory modelUser.fromJson(Map<String, dynamic>json){
    return modelUser(nome: json['name'], email: json['email'], telefone: json['phone']);
  }

}

void main(){
  getPost();


}