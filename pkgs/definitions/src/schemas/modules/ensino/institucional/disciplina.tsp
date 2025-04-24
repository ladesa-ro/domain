using TypeSpec.JsonSchema;

using Ladesa.v3.Generics;
using Ladesa.v3.Generics.Entities;

namespace Ladesa.v3.Schemas;

/** Disciplina. */
@Metadata.EntityId(Tokens.Disciplina)
model Disciplina {
  ...EntityIdUuid;

  /** Nome da disciplina. */
  @minLength(1)
  nome: string;

  /** Nome abreviado da disciplina. */
  @minLength(1)
  nomeAbreviado: string;

  /** Carga horária da disciplina. */
  @minValue(1)
  cargaHoraria: uint16;

  /** Imagem de capa da disciplina. */
  imagemCapa: Imagem | null;

  /** Diários que vinculam esta disciplina. */
  diarios: Diario[];

  ...EntityDated;
}

/** Visão completa de uma Disciplina. */
@Metadata.EntityId(Tokens.Disciplina_View)
model DisciplinaView {
  ...OmitProperties<Disciplina, "imagemCapa">;
  imagemCapa: ImagemFindOneResultView | null;
}

/** Dados de entrada para encontrar uma Disciplina por ID. */
@Metadata.EntityId(Tokens.Disciplina_FindOneInput_View)
model DisciplinaFindOneInputView {
  @extension("x-unispec-constraint-entity-exists", Json<Tokens.Disciplina>)
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
