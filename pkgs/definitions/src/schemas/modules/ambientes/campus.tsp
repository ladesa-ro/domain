using TypeSpec.JsonSchema;

using Ladesa.v3.Generics;
using Ladesa.v3.Generics.Entities;
using Ladesa.v3.Generics.Pagination.Result;

namespace Ladesa.v3.Schemas;

/** Campus. */
@Metadata.EntityId(Tokens.Campus)
model Campus {
  ...EntityIdUuid;

  /** Nome fantasia do campus. */
  @minLength(1)
  nomeFantasia: string;

  /** Razão social do campus. */
  @minLength(1)
  razaoSocial: string;

  /** Apelido do campus. */
  @minLength(1)
  apelido: string;

  /** CNPJ do campus. */
  @minLength(1)
  cnpj: string;

  /** Endereço do campus */
  endereco: Endereco;

  ...EntityDated;
}

/** Visão completa de um campus. */
@Metadata.EntityId(Tokens.Campus_View)
model CampusView {
  ...OmitProperties<Campus, "endereco">;
  endereco: EnderecoFindOneResultView;
}

/**
 * Dados de entrada para encontrar um campus por id.
 */
@Metadata.EntityId(Tokens.Campus_FindOneInput_View)
model CampusFindOneInputView {
  @extension("x-unispec-constraint-entity-exists", Json<Tokens.Campus>)
  id: Campus.id;
}

/**
 * Visão FindOne de um campus.
 */
@Metadata.EntityId(Tokens.Campus_FindOneResult_View)
@Metadata.EntityPartialOfId(Tokens.Campus_View)
model CampusFindOneResultView {
  //
  ...PickProperties<CampusView, "id">;

  ...PickProperties<CampusView, "nomeFantasia">;
  ...PickProperties<CampusView, "razaoSocial">;
  ...PickProperties<CampusView, "apelido">;
  ...PickProperties<CampusView, "cnpj">;

  //
  ...PickProperties<CampusView, "endereco">;

  //
  ...PickProperties<CampusView, "dateCreated" | "dateUpdated" | "dateDeleted">;
}

/** Resultados da busca a campi. */
@Metadata.EntityId(Tokens.Campus_ListResult_View)
model CampusListResultView is PaginationResultView<CampusFindOneResultView>;

/**
 * Dados de entrada para a criação de um campus.
 */
@Metadata.EntityId(Tokens.Campus_InputCreate_View)
model CampusInputCreateView {
  ...PickProperties<CampusView, "nomeFantasia">;
  ...PickProperties<CampusView, "razaoSocial">;
  ...PickProperties<CampusView, "apelido">;
  ...PickProperties<CampusView, "cnpj">;
  endereco: EnderecoInput;
}

/** Dados de entrada para a atualização de um campus. */
@Metadata.EntityId(Tokens.Campus_InputUpdate_View)
model CampusInputUpdateView is OptionalProperties<CampusInputCreateView>;
