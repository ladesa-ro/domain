using TypeSpec.JsonSchema;

using Ladesa.v3.Generics;
using Ladesa.v3.Generics.Entities;

namespace Ladesa.v3.Schemas;

/** Diario. */
@Metadata.EntityId(Tokens.Diario)
model Diario {
  ...EntityIdUuid;

  /** Situação do diário. */
  ativo: boolean;

  /** Calendário Letivo vinculado ao diário. */
  calendarioLetivo: CalendarioLetivo;

  /** Turma vinculada ao diário. */
  turma: Turma;

  /** Disciplina vinculada ao diário. */
  disciplina: Disciplina;

  /** Ambiente padrão. */
  ambientePadrao: Ambiente | null;

  /** Imagem de capa do diário. */
  imagemCapa: Imagem | null;

  ...EntityDated;
}

/** Visão completa de um diário. */
@Metadata.EntityId(Tokens.Diario_View)
model DiarioView {
  ...OmitProperties<
    Diario,

      | "calendarioLetivo"
      | "turma"
      | "disciplina"
      | "ambientePadrao"
      | "imagemCapa"
  >;
  calendarioLetivo: CalendarioLetivoFindOneResultView;
  turma: TurmaFindOneResultView;
  disciplina: DisciplinaFindOneResultView;
  ambientePadrao: AmbienteFindOneResultView | null;
  imagemCapa: ImagemFindOneResultView | null;
}

/** Dados de entrada para encontrar um diário por ID. */
@Metadata.EntityId(Tokens.Diario_FindOneInput_View)
model DiarioFindOneInputView {
  @extension("x-unispec-constraint-entity-exists", Json<Tokens.Diario>)
  id: Diario.id;
}

/** Visão FindOne de um diário. */
@Metadata.EntityId(Tokens.Diario_FindOneResult_View)
@Metadata.EntityPartialOfId(Tokens.Diario_View)
model DiarioFindOneResultView {
  ...PickProperties<DiarioView, "id" | "ativo">;
  ...PickProperties<
    DiarioView,

      | "calendarioLetivo"
      | "turma"
      | "disciplina"
      | "ambientePadrao"
      | "imagemCapa"
  >;
  ...PickProperties<DiarioView, "dateCreated" | "dateUpdated" | "dateDeleted">;
}

/** Dados de entrada para a criação de um diário. */
@Metadata.EntityId(Tokens.Diario_InputCreate_View)
model DiarioInputCreateView {
  ativo: boolean;
  calendarioLetivo: CalendarioLetivoFindOneInputView;
  turma: TurmaFindOneInputView;
  disciplina: DisciplinaFindOneInputView;
  ambientePadrao: AmbienteFindOneInputView | null;
}

/** Dados de entrada para a atualização de um diário. */
@Metadata.EntityId(Tokens.Diario_InputUpdate_View)
model DiarioInputUpdateView is OptionalProperties<DiarioInputCreateView>;

/** Resultados da busca a Diarios. */
@Metadata.EntityId(Tokens.Diario_ListResult_View)
model DiarioListResultView is Pagination.Result.View<DiarioFindOneResultView>;
