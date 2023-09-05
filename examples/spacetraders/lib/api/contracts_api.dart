import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:spacetraders/model/agent.dart';
import 'package:spacetraders/model/contract.dart';
import 'package:spacetraders/model/meta.dart';
import 'package:spacetraders/model/ship_cargo.dart';

class ContractsApi {
  Future<GetContracts200Response> getContracts(
    int page,
    int limit,
  ) async {
    final response = await http.post(
      Uri.parse('https://api.spacetraders.io/v2/my/contracts'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'page': page,
        'limit': limit,
      }),
    );

    if (response.statusCode == 200) {
      return GetContracts200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    } else {
      throw Exception('Failed to load getContracts');
    }
  }

  Future<GetContract200Response> getContract() async {
    final response = await http.post(
      Uri.parse('https://api.spacetraders.io/v2/my/contracts/%7BcontractId%7D'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({}),
    );

    if (response.statusCode == 200) {
      return GetContract200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    } else {
      throw Exception('Failed to load getContract');
    }
  }

  Future<AcceptContract200Response> acceptContract() async {
    final response = await http.post(
      Uri.parse(
        'https://api.spacetraders.io/v2/my/contracts/%7BcontractId%7D/accept',
      ),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({}),
    );

    if (response.statusCode == 200) {
      return AcceptContract200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    } else {
      throw Exception('Failed to load acceptContract');
    }
  }

  Future<DeliverContract200Response> deliverContract(
    DeliverContractRequest deliverContractRequest,
  ) async {
    final response = await http.post(
      Uri.parse(
        'https://api.spacetraders.io/v2/my/contracts/%7BcontractId%7D/deliver',
      ),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'deliverContractRequest': deliverContractRequest.toJson(),
      }),
    );

    if (response.statusCode == 200) {
      return DeliverContract200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    } else {
      throw Exception('Failed to load deliverContract');
    }
  }

  Future<FulfillContract200Response> fulfillContract() async {
    final response = await http.post(
      Uri.parse(
        'https://api.spacetraders.io/v2/my/contracts/%7BcontractId%7D/fulfill',
      ),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({}),
    );

    if (response.statusCode == 200) {
      return FulfillContract200Response.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    } else {
      throw Exception('Failed to load fulfillContract');
    }
  }
}

class GetContracts200Response {
  GetContracts200Response({
    required this.data,
    required this.meta,
  });

  factory GetContracts200Response.fromJson(Map<String, dynamic> json) {
    return GetContracts200Response(
      data: (json['data'] as List<dynamic>)
          .map<Contract>((e) => Contract.fromJson(e as Map<String, dynamic>))
          .toList(),
      meta: Meta.fromJson(json['meta'] as Map<String, dynamic>),
    );
  }

  final List<Contract> data;
  final Meta meta;

  Map<String, dynamic> toJson() {
    return {
      'data': data.map((e) => e.toJson()).toList(),
      'meta': meta.toJson(),
    };
  }
}

class GetContract200Response {
  GetContract200Response({
    required this.data,
  });

  factory GetContract200Response.fromJson(Map<String, dynamic> json) {
    return GetContract200Response(
      data: Contract.fromJson(json['data'] as Map<String, dynamic>),
    );
  }

  final Contract data;

  Map<String, dynamic> toJson() {
    return {
      'data': data.toJson(),
    };
  }
}

class AcceptContract200Response {
  AcceptContract200Response({
    required this.data,
  });

  factory AcceptContract200Response.fromJson(Map<String, dynamic> json) {
    return AcceptContract200Response(
      data: AcceptContract200ResponseData.fromJson(
        json['data'] as Map<String, dynamic>,
      ),
    );
  }

  final AcceptContract200ResponseData data;

  Map<String, dynamic> toJson() {
    return {
      'data': data.toJson(),
    };
  }
}

class AcceptContract200ResponseData {
  AcceptContract200ResponseData({
    required this.agent,
    required this.contract,
  });

  factory AcceptContract200ResponseData.fromJson(Map<String, dynamic> json) {
    return AcceptContract200ResponseData(
      agent: Agent.fromJson(json['agent'] as Map<String, dynamic>),
      contract: Contract.fromJson(json['contract'] as Map<String, dynamic>),
    );
  }

  final Agent agent;
  final Contract contract;

  Map<String, dynamic> toJson() {
    return {
      'agent': agent.toJson(),
      'contract': contract.toJson(),
    };
  }
}

class DeliverContract200Response {
  DeliverContract200Response({
    required this.data,
  });

  factory DeliverContract200Response.fromJson(Map<String, dynamic> json) {
    return DeliverContract200Response(
      data: DeliverContract200ResponseData.fromJson(
        json['data'] as Map<String, dynamic>,
      ),
    );
  }

  final DeliverContract200ResponseData data;

  Map<String, dynamic> toJson() {
    return {
      'data': data.toJson(),
    };
  }
}

class DeliverContract200ResponseData {
  DeliverContract200ResponseData({
    required this.contract,
    required this.cargo,
  });

  factory DeliverContract200ResponseData.fromJson(Map<String, dynamic> json) {
    return DeliverContract200ResponseData(
      contract: Contract.fromJson(json['contract'] as Map<String, dynamic>),
      cargo: ShipCargo.fromJson(json['cargo'] as Map<String, dynamic>),
    );
  }

  final Contract contract;
  final ShipCargo cargo;

  Map<String, dynamic> toJson() {
    return {
      'contract': contract.toJson(),
      'cargo': cargo.toJson(),
    };
  }
}

class DeliverContractRequest {
  DeliverContractRequest({
    required this.shipSymbol,
    required this.tradeSymbol,
    required this.units,
  });

  factory DeliverContractRequest.fromJson(Map<String, dynamic> json) {
    return DeliverContractRequest(
      shipSymbol: json['shipSymbol'] as String,
      tradeSymbol: json['tradeSymbol'] as String,
      units: json['units'] as int,
    );
  }

  final String shipSymbol;
  final String tradeSymbol;
  final int units;

  Map<String, dynamic> toJson() {
    return {
      'shipSymbol': shipSymbol,
      'tradeSymbol': tradeSymbol,
      'units': units,
    };
  }
}

class FulfillContract200Response {
  FulfillContract200Response({
    required this.data,
  });

  factory FulfillContract200Response.fromJson(Map<String, dynamic> json) {
    return FulfillContract200Response(
      data: FulfillContract200ResponseData.fromJson(
        json['data'] as Map<String, dynamic>,
      ),
    );
  }

  final FulfillContract200ResponseData data;

  Map<String, dynamic> toJson() {
    return {
      'data': data.toJson(),
    };
  }
}

class FulfillContract200ResponseData {
  FulfillContract200ResponseData({
    required this.agent,
    required this.contract,
  });

  factory FulfillContract200ResponseData.fromJson(Map<String, dynamic> json) {
    return FulfillContract200ResponseData(
      agent: Agent.fromJson(json['agent'] as Map<String, dynamic>),
      contract: Contract.fromJson(json['contract'] as Map<String, dynamic>),
    );
  }

  final Agent agent;
  final Contract contract;

  Map<String, dynamic> toJson() {
    return {
      'agent': agent.toJson(),
      'contract': contract.toJson(),
    };
  }
}