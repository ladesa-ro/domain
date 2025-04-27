using Ladesa.Domain.v4.Generics;
using Ladesa.Domain.v4.Generics.Entities;

namespace Ladesa.Domain.v4.Schemas;

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
  @Metadata.Constraints.EntityExists(Tokens.Campus)
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
model CampusListResultView is Pagination.Result.View<CampusFindOneResultView>;

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
