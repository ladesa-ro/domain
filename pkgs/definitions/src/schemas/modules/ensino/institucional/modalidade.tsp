using Ladesa.Domain.v3.Generics;
using Ladesa.Domain.v3.Generics.Entities;

namespace Ladesa.Domain.v3.Schemas;

/** Modalidade. */
@Metadata.EntityId(Tokens.Modalidade)
model Modalidade {
  ...EntityIdUuid;

  /** Nome da modalidade. */
  @minLength(1)
  nome: string;

  /** Apelido da modalidade. */
  @minLength(1)
  slug: string;

  ...EntityDated;
}

/** Visão completa de uma modalidade. */
@Metadata.EntityId(Tokens.Modalidade_View)
model ModalidadeView {
  ...Modalidade;
}

/** Dados de entrada para encontrar uma modalidade por ID. */
@Metadata.EntityId(Tokens.Modalidade_FindOneInput_View)
model ModalidadeFindOneInputView {
  @Metadata.Constraints.EntityExists(Tokens.Modalidade)
  id: Modalidade.id;
}

/** Visão FindOne de uma modalidade. */
@Metadata.EntityId(Tokens.Modalidade_FindOneResult_View)
@Metadata.EntityPartialOfId(Tokens.Modalidade_View)
model ModalidadeFindOneResultView {
  ...PickProperties<ModalidadeView, "id">;
  ...PickProperties<ModalidadeView, "slug">;
  ...PickProperties<
    ModalidadeView,
    "dateCreated" | "dateUpdated" | "dateDeleted"
  >;
}

/** Dados de entrada para a criação de uma modalidade. */
@Metadata.EntityId(Tokens.Modalidade_InputCreate_View)
model ModalidadeInputCreateView {
  ...PickProperties<ModalidadeView, "slug">;
}

/** Dados de entrada para a atualização de uma modalidade. */
@Metadata.EntityId(Tokens.Modalidade_InputUpdate_View)
model ModalidadeInputUpdateView
  is OptionalProperties<ModalidadeInputCreateView>;

/** Resultados da busca a Modalidades. */
@Metadata.EntityId(Tokens.Modalidade_ListResult_View)
model ModalidadeListResultView
  is Pagination.Result.View<ModalidadeFindOneResultView>;
