using Ladesa.Domain.v4.Generics;
using Ladesa.Domain.v4.Generics.Entities;

namespace Ladesa.Domain.v4.Schemas;

/** Visão completa de uma TurmaDisponibilidade. */
@Metadata.EntityId(Tokens.TurmaDisponibilidade_View)
model TurmaDisponibilidadeView {
  ...OmitProperties<TurmaDisponibilidade, "disponibilidade" | "turma">;
  disponibilidade: DisponibilidadeFindOneResultView;
  turma: TurmaFindOneResultView;
}

/** Dados de entrada para encontrar uma TurmaDisponibilidade por ID. */
@Metadata.EntityId(Tokens.TurmaDisponibilidade_FindOneInput_View)
model TurmaDisponibilidadeFindOneInputView {
  @Metadata.Constraints.EntityExists(Tokens.TurmaDisponibilidade)
  id: TurmaDisponibilidade.id;
}

/** Visão FindOne de uma TurmaDisponibilidade. */
@Metadata.EntityId(Tokens.TurmaDisponibilidade_FindOneResult_View)
@Metadata.EntityPartialOfId(Tokens.TurmaDisponibilidade)
model TurmaDisponibilidadeFindOneResultView {
  ...PickProperties<TurmaDisponibilidadeView, "id">;
  ...PickProperties<TurmaDisponibilidadeView, "disponibilidade" | "turma">;
  ...PickProperties<
    TurmaDisponibilidadeView,
    "dateCreated" | "dateUpdated" | "dateDeleted"
  >;
}

/** Dados de entrada para a criação de uma TurmaDisponibilidade. */
@Metadata.EntityId(Tokens.TurmaDisponibilidade_InputCreate_View)
model TurmaDisponibilidadeInputCreateView {
  disponibilidade: DisponibilidadeFindOneInputView;
  turma: TurmaFindOneInputView;
}

/** Dados de entrada para a atualização de uma TurmaDisponibilidade. */
@Metadata.EntityId(Tokens.TurmaDisponibilidade_InputUpdate_View)
model TurmaDisponibilidadeInputUpdateView
  is OptionalProperties<TurmaDisponibilidadeInputCreateView>;

/** Resultados da busca a TurmaDisponibilidades. */
@Metadata.EntityId(Tokens.TurmaDisponibilidade_ListResult_View)
model TurmaDisponibilidadeListResultView
  is Pagination.Result.View<TurmaDisponibilidadeFindOneResultView>;
