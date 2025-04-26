using Ladesa.Domain.v4.Generics;
using Ladesa.Domain.v4.Generics.Entities;

namespace Ladesa.Domain.v4.Schemas;

/** NivelFormacao. */
@Metadata.EntityId(Tokens.NivelFormacao)
model NivelFormacao {
  ...EntityIdUuid;

  /** Apelido do nível de formação. */
  @minLength(1)
  slug: string;

  ...EntityDated;
}

/** Visão completa de um nível de formação. */
@Metadata.EntityId(Tokens.NivelFormacao_View)
model NivelFormacaoView {
  ...NivelFormacao;
}

/** Dados de entrada para encontrar um nível de formação por ID. */
@Metadata.EntityId(Tokens.NivelFormacao_FindOneInput_View)
model NivelFormacaoFindOneInputView {
  @Metadata.Constraints.EntityExists(Tokens.NivelFormacao)
  id: NivelFormacao.id;
}

/** Visão FindOne de um nível de formação. */
@Metadata.EntityId(Tokens.NivelFormacao_FindOneResult_View)
@Metadata.EntityPartialOfId(Tokens.NivelFormacao_View)
model NivelFormacaoFindOneResultView {
  ...PickProperties<NivelFormacaoView, "id">;
  ...PickProperties<NivelFormacaoView, "slug">;
  ...PickProperties<
    NivelFormacaoView,
    "dateCreated" | "dateUpdated" | "dateDeleted"
  >;
}

/** Dados de entrada para a criação de um nível de formação. */
@Metadata.EntityId(Tokens.NivelFormacao_InputCreate_View)
model NivelFormacaoInputCreateView {
  ...PickProperties<NivelFormacaoView, "slug">;
}

/** Dados de entrada para a atualização de um nível de formação. */
@Metadata.EntityId(Tokens.NivelFormacao_InputUpdate_View)
model NivelFormacaoInputUpdateView
  is OptionalProperties<NivelFormacaoInputCreateView>;

/** Resultados da busca aos níveis de formações. */
@Metadata.EntityId(Tokens.NivelFormacao_ListResult_View)
model NivelFormacaoListResultView
  is Pagination.Result.View<NivelFormacaoFindOneResultView>;
