using Ladesa.Domain.v4.Generics;
using Ladesa.Domain.v4.Generics.Entities;

namespace Ladesa.Domain.v4.Schemas;

/** Estado. */
@Metadata.EntityId(Tokens.Estado)
model Estado {
  ...EntityIdInteger;

  /** Nome oficial do estado. */
  nome: string;

  /** Sigla do estado. */
  @Metadata.Constraints.EnderecoEstadoSigla
  sigla: string;
}

/** Visão completa de um estado. */
@Metadata.EntityId(Tokens.Estado_View)
model EstadoView {
  ...Estado;
}

/**
 * Dados de entrada para encontrar um estado por id.
 */
@Metadata.EntityId(Tokens.Estado_FindOneInput_View)
model EstadoFindOneInputView is PickProperties<EstadoView, "id">;

/**
 * Visão FindOne de um estado.
 */
@Metadata.EntityId(Tokens.Estado_FindOneResult_View)
@Metadata.EntityPartialOfId(Tokens.Estado_View)
model EstadoFindOneResultView {
  //
  ...PickProperties<EstadoView, "id">;

  ...PickProperties<EstadoView, "nome">;
  ...PickProperties<EstadoView, "sigla">;
}

/** Resultados da busca a estados. */
@Metadata.EntityId(Tokens.Estado_ListResult_View)
model EstadoListResultView is Pagination.Result.View<EstadoFindOneResultView>;
