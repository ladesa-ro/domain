using Ladesa.Domain.v4.Generics;
using Ladesa.Domain.v4.Generics.Entities;

namespace Ladesa.Domain.v4.Schemas;

/** Visão completa de uma ProfessorDisponibilidade. */
@Metadata.EntityId(Tokens.ProfessorDisponibilidade_View)
model ProfessorDisponibilidadeView {
  ...OmitProperties<ProfessorDisponibilidade, "disponibilidade" | "perfil">;
  disponibilidade: DisponibilidadeFindOneResultView;
  perfil: PerfilFindOneResultView;
}

/** Dados de entrada para encontrar uma ProfessorDisponibilidade por ID. */
@Metadata.EntityId(Tokens.ProfessorDisponibilidade_FindOneInput_View)
model ProfessorDisponibilidadeFindOneInputView {
  @Metadata.Constraints.EntityExists(Tokens.ProfessorDisponibilidade)
  id: ProfessorDisponibilidade.id;
}

/** Visão FindOne de uma ProfessorDisponibilidade. */
@Metadata.EntityId(Tokens.ProfessorDisponibilidade_FindOneResult_View)
@Metadata.EntityPartialOfId(Tokens.ProfessorDisponibilidade)
model ProfessorDisponibilidadeFindOneResultView {
  ...PickProperties<ProfessorDisponibilidadeView, "id">;
  ...PickProperties<ProfessorDisponibilidadeView, "disponibilidade" | "perfil">;
  ...PickProperties<
    ProfessorDisponibilidadeView,
    "dateCreated" | "dateUpdated" | "dateDeleted"
  >;
}

/** Dados de entrada para a criação de uma ProfessorDisponibilidade. */
@Metadata.EntityId(Tokens.ProfessorDisponibilidade_InputCreate_View)
model ProfessorDisponibilidadeInputCreateView {
  disponibilidade: DisponibilidadeFindOneInputView;
  perfil: PerfilFindOneInputView;
}

/** Dados de entrada para a atualização de uma ProfessorDisponibilidade. */
@Metadata.EntityId(Tokens.ProfessorDisponibilidade_InputUpdate_View)
model ProfessorDisponibilidadeInputUpdateView
  is OptionalProperties<ProfessorDisponibilidadeInputCreateView>;

/** Resultados da busca a ProfessorDisponibilidades. */
@Metadata.EntityId(Tokens.ProfessorDisponibilidade_ListResult_View)
model ProfessorDisponibilidadeListResultView
  is Pagination.Result.View<ProfessorDisponibilidadeFindOneResultView>;
