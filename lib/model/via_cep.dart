class ViaCeps {
  List<ViaCep>? _viaCeps;

  ViaCeps({List<ViaCep>? viaCep}) {
    if (viaCep != null) {
      _viaCeps = viaCep;
    }
  }

  List<ViaCep>? get viaCeps => _viaCeps;
  set viaCeps(List<ViaCep>? viaCeps) => _viaCeps = viaCeps;

  ViaCeps.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      _viaCeps = <ViaCep>[];
      json['results'].forEach((v) {
        _viaCeps!.add(ViaCep.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (_viaCeps != null) {
      data['results'] = _viaCeps!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ViaCep {
  String? _objectId;
  String? _cep;
  String? _logradouro;
  String? _complemento;
  String? _bairro;
  String? _localidade;
  String? _uf;
  String? _ibge;
  String? _gia;
  String? _ddd;
  String? _siafi;
  String? _createdAt;
  String? _updatedAt;

  ViaCep(
      {String? objectId,
      String? cep,
      String? logradouro,
      String? complemento,
      String? bairro,
      String? localidade,
      String? uf,
      String? ibge,
      String? gia,
      String? ddd,
      String? siafi,
      String? createdAt,
      String? updatedAt}) {
    if (objectId != null) {
      _objectId = objectId;
    }
    if (cep != null) {
      _cep = cep;
    }
    if (logradouro != null) {
      _logradouro = logradouro;
    }
    if (complemento != null) {
      _complemento = complemento;
    }
    if (bairro != null) {
      _bairro = bairro;
    }
    if (localidade != null) {
      _localidade = localidade;
    }
    if (uf != null) {
      _uf = uf;
    }
    if (ibge != null) {
      _ibge = ibge;
    }
    if (gia != null) {
      _gia = gia;
    }
    if (ddd != null) {
      _ddd = ddd;
    }
    if (siafi != null) {
      _siafi = siafi;
    }
    if (createdAt != null) {
      _createdAt = createdAt;
    }
    if (updatedAt != null) {
      _updatedAt = updatedAt;
    }
  }

  ViaCep.vazio();

  ViaCep.create({
    String? cep,
    String? logradouro,
    String? complemento,
    String? bairro,
    String? localidade,
    String? uf,
    String? ibge,
    String? gia,
    String? ddd,
    String? siafi,
  }) {
    if (cep != null) {
      _cep = cep;
    }
    if (logradouro != null) {
      _logradouro = logradouro;
    }
    if (complemento != null) {
      _complemento = complemento;
    }
    if (bairro != null) {
      _bairro = bairro;
    }
    if (localidade != null) {
      _localidade = localidade;
    }
    if (uf != null) {
      _uf = uf;
    }
    if (ibge != null) {
      _ibge = ibge;
    }
    if (gia != null) {
      _gia = gia;
    }
    if (ddd != null) {
      _ddd = ddd;
    }
    if (siafi != null) {
      _siafi = siafi;
    }
  }

  String? get objectId => _objectId;
  set objectId(String? objectId) => _objectId = objectId;
  String? get cep => _cep;
  set cep(String? cep) => _cep = cep;
  String? get logradouro => _logradouro;
  set logradouro(String? logradouro) => _logradouro = logradouro;
  String? get complemento => _complemento;
  set complemento(String? complemento) => _complemento = complemento;
  String? get bairro => _bairro;
  set bairro(String? bairro) => _bairro = bairro;
  String? get localidade => _localidade;
  set localidade(String? localidade) => _localidade = localidade;
  String? get uf => _uf;
  set uf(String? uf) => _uf = uf;
  String? get ibge => _ibge;
  set ibge(String? ibge) => _ibge = ibge;
  String? get gia => _gia;
  set gia(String? gia) => _gia = gia;
  String? get ddd => _ddd;
  set ddd(String? ddd) => _ddd = ddd;
  String? get siafi => _siafi;
  set siafi(String? siafi) => _siafi = siafi;
  String? get createdAt => _createdAt;
  set createdAt(String? createdAt) => _createdAt = createdAt;
  String? get updatedAt => _updatedAt;
  set updatedAt(String? updatedAt) => _updatedAt = updatedAt;

  ViaCep.fromJson(Map<String, dynamic> json) {
    _objectId = json['objectId'];
    _cep = json['cep'];
    _logradouro = json['logradouro'];
    _complemento = json['complemento'];
    _bairro = json['bairro'];
    _localidade = json['localidade'];
    _uf = json['uf'];
    _ibge = json['ibge'];
    _gia = json['gia'];
    _ddd = json['ddd'];
    _siafi = json['siafi'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['objectId'] = _objectId;
    data['cep'] = _cep;
    data['logradouro'] = _logradouro;
    data['complemento'] = _complemento;
    data['bairro'] = _bairro;
    data['localidade'] = _localidade;
    data['uf'] = _uf;
    data['ibge'] = _ibge;
    data['gia'] = _gia;
    data['ddd'] = _ddd;
    data['siafi'] = _siafi;
    data['createdAt'] = _createdAt;
    data['updatedAt'] = _updatedAt;
    return data;
  }

  Map<String, dynamic> toCreateJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cep'] = _cep;
    data['logradouro'] = _logradouro;
    data['complemento'] = _complemento;
    data['bairro'] = _bairro;
    data['localidade'] = _localidade;
    data['uf'] = _uf;
    data['ibge'] = _ibge;
    data['gia'] = _gia;
    data['ddd'] = _ddd;
    data['siafi'] = _siafi;
    return data;
  }

  Map<String, dynamic> toUpdateJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['logradouro'] = _logradouro;
    return data;
  }
}
