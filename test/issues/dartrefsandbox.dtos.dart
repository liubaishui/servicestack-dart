/* Options:
Date: 2019-05-24 00:44:08
Version: 5.50
Tip: To override a DTO option, remove "//" prefix before updating
BaseUrl: http://localhost:5000

//GlobalNamespace: 
//AddServiceStackTypes: True
//AddResponseStatus: False
//AddImplicitVersion: 
//AddDescriptionAsComments: True
//IncludeTypes: 
//ExcludeTypes: 
DefaultImports: ../../lib/servicestack.dart
*/

import '../../lib/servicestack.dart';

class FooListDto implements IConvertible
{
    String id;

    FooListDto({this.id});
    FooListDto.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        id = json['id'];
        return this;
    }

    Map<String, dynamic> toJson() => {
        'id': id
    };

    TypeContext context = _ctx;
}

abstract class PagedRequest
{
    int page;
    int pageSize;

    PagedRequest({this.page,this.pageSize});
    PagedRequest.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        page = json['page'];
        pageSize = json['pageSize'];
        return this;
    }

    Map<String, dynamic> toJson() => {
        'page': page,
        'pageSize': pageSize
    };

    TypeContext context = _ctx;
}

abstract class PagedAndOrderedRequest extends PagedRequest
{
    String orderBy;

    PagedAndOrderedRequest({this.orderBy});
    PagedAndOrderedRequest.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        orderBy = json['orderBy'];
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson()..addAll({
        'orderBy': orderBy
    });

    TypeContext context = _ctx;
}

class PagedResult<T> implements IConvertible
{
    int page;
    int pageSize;
    int totalResults;
    List<T> results;

    PagedResult({this.page,this.pageSize,this.totalResults,this.results});
    PagedResult.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        page = json['page'];
        pageSize = json['pageSize'];
        totalResults = json['totalResults'];
        results = JsonConverters.fromJson(json['results'],'List<${runtimeGenericTypeDefs(this,[0]).join(",")}>',context);
        return this;
    }

    Map<String, dynamic> toJson() => {
        'page': page,
        'pageSize': pageSize,
        'totalResults': totalResults,
        'results': JsonConverters.toJson(results,'List<T>',context)
    };

    TypeContext context = _ctx;
}

class UnknownTypes implements IConvertible
{
    List<FooListDto> fooListDtos;

    UnknownTypes({this.fooListDtos});
    UnknownTypes.fromJson(Map<String, dynamic> json) { fromMap(json); }

    fromMap(Map<String, dynamic> json) {
        fooListDtos = JsonConverters.fromJson(json['fooListDtos'],'List<FooListDto>',context);
        return this;
    }

    Map<String, dynamic> toJson() => {
        'fooListDtos': JsonConverters.toJson(fooListDtos,'List<FooListDto>',context)
    };

    TypeContext context = _ctx;
}

// @Route("/foos", "GET")
class GetFoos extends PagedAndOrderedRequest implements IReturn<PagedResult<FooListDto>>, IConvertible
{
    GetFoos();
    GetFoos.fromJson(Map<String, dynamic> json) : super.fromJson(json);
    fromMap(Map<String, dynamic> json) {
        super.fromMap(json);
        return this;
    }

    Map<String, dynamic> toJson() => super.toJson();
    createResponse() { return new PagedResult<FooListDto>(); }
    String getTypeName() { return "GetFoos"; }
    TypeContext context = _ctx;
}

TypeContext _ctx = new TypeContext(library: 'localhost', types: <String, TypeInfo> {
    'FooListDto': new TypeInfo(TypeOf.Class, create:() => new FooListDto()),
    'PagedRequest': new TypeInfo(TypeOf.AbstractClass),
    'PagedAndOrderedRequest': new TypeInfo(TypeOf.AbstractClass),
    'PagedResult<T>': new TypeInfo(TypeOf.GenericDef,create:() => new PagedResult()),
    'UnknownTypes': new TypeInfo(TypeOf.Class, create:() => new UnknownTypes()),
    'List<FooListDto>': new TypeInfo(TypeOf.Class, create:() => new List<FooListDto>()),
    'GetFoos': new TypeInfo(TypeOf.Class, create:() => new GetFoos()),
});

