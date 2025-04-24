using Ladesa.v3.Generics;
using Ladesa.v3.Generics.Entities;

namespace Ladesa.v3.Schemas;

/** Cidade. */
@Metadata.EntityId(Tokens.Cidade)
model Cidade {
  ...EntityIdInteger;

  /** Nome oficial da cidade. */
  nome: string;

  /** Estado da cidade */
  estado: Estado;
}

/** Visão completa de uma cidade. */
@Metadata.EntityId(Tokens.Cidade_View)
model CidadeView {
  ...OmitProperties<Cidade, "estado">;
  estado: EstadoFindOneResultView;
}

/**
 * Dados de entrada para encontrar uma cidade por id.
 */
@Metadata.EntityId(Tokens.Cidade_FindOneInput_View)
model CidadeFindOneInputView is PickProperties<CidadeView, "id">;

/**
 * Visão FindOne de uma cidade.
 */
@Metadata.EntityId(Tokens.Cidade_FindOneResult_View)
@Metadata.EntityPartialOfId(Tokens.Cidade_View)
model CidadeFindOneResultView {
  //
  ...PickProperties<CidadeView, "id">;

  ...PickProperties<CidadeView, "nome">;
  ...PickProperties<CidadeView, "estado">;
}

/** Resultados da busca a cidades. */
@Metadata.EntityId(Tokens.Cidade_ListResult_View)
model CidadeListResultView is Pagination.Result.View<CidadeFindOneResultView>;
