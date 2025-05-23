using Ladesa.Domain.v4.Generics;
using Ladesa.Domain.v4.Generics.Entities;

namespace Ladesa.Domain.v4.Schemas;

/** Visão completa de uma Disciplina. */
@Metadata.EntityId(Tokens.Disciplina_View)
model DisciplinaView {
  ...OmitProperties<Disciplina, "imagemCapa">;
  imagemCapa: ImagemFindOneResultView | null;
}

/** Dados de entrada para encontrar uma Disciplina por ID. */
@Metadata.EntityId(Tokens.Disciplina_FindOneInput_View)
model DisciplinaFindOneInputView {
  @Metadata.Constraints.EntityExists(Tokens.Disciplina)
  id: Disciplina.id;
}

/** Visão FindOne de uma Disciplina. */
@Metadata.EntityId(Tokens.Disciplina_FindOneResult_View)
@Metadata.EntityPartialOfId(Tokens.Disciplina_View)
model DisciplinaFindOneResultView {
  //
  ...PickProperties<DisciplinaView, "id">;

  ...PickProperties<DisciplinaView, "nome">;
  ...PickProperties<DisciplinaView, "nomeAbreviado">;
  ...PickProperties<DisciplinaView, "cargaHoraria">;

  //
  ...PickProperties<DisciplinaView, "imagemCapa">;

  //
  ...PickProperties<
    DisciplinaView,
    "dateCreated" | "dateUpdated" | "dateDeleted"
  >;
}

/** Dados de entrada para a criação de uma Disciplina. */
@Metadata.EntityId(Tokens.Disciplina_InputCreate_View)
model DisciplinaInputCreateView {
  ...PickProperties<DisciplinaView, "nome">;
  ...PickProperties<DisciplinaView, "nomeAbreviado">;
  ...PickProperties<DisciplinaView, "cargaHoraria">;
}

/** Dados de entrada para a atualização de uma Disciplina. */
@Metadata.EntityId(Tokens.Disciplina_InputUpdate_View)
model DisciplinaInputUpdateView
  is OptionalProperties<DisciplinaInputCreateView>;

/** Resultados da busca a Disciplinas. */
@Metadata.EntityId(Tokens.Disciplina_ListResult_View)
model DisciplinaListResultView
  is Pagination.Result.View<DisciplinaFindOneResultView>;
