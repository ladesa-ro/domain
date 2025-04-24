using Ladesa.v3.Generics;
using Ladesa.v3.Generics.Entities;

namespace Ladesa.v3.Schemas;

/** Turma. */
@Metadata.EntityId(Tokens.Turma)
model Turma {
  ...EntityIdUuid;

  /** Período da Turma. */
  @minLength(1)
  periodo: string;

  /** Curso da Turma. */
  curso: Curso;

  /** Ambiente padrão da sala de aula. */
  ambientePadraoAula: Ambiente | null;

  /** Imagem de capa da Turma. */
  imagemCapa: Imagem | null;

  ...EntityDated;
}

/** Visão completa de uma Turma. */
@Metadata.EntityId(Tokens.Turma_View)
model TurmaView {
  ...OmitProperties<Turma, "curso" | "ambientePadraoAula" | "imagemCapa">;
  curso: CursoFindOneResultView;
  ambientePadraoAula: AmbienteFindOneResultView | null;
  imagemCapa: ImagemFindOneResultView | null;
}

/** Dados de entrada para encontrar uma Turma por ID. */
@Metadata.EntityId(Tokens.Turma_FindOneInput_View)
model TurmaFindOneInputView {
  @Metadata.Constraints.EntityExists(Tokens.Turma)
  id: Turma.id;
}

/** Visão FindOne de uma Turma. */
@Metadata.EntityId(Tokens.Turma_FindOneResult_View)
@Metadata.EntityPartialOfId(Tokens.Turma_View)
model TurmaFindOneResultView {
  //
  ...PickProperties<TurmaView, "id">;

  ...PickProperties<TurmaView, "periodo">;

  //
  ...PickProperties<TurmaView, "curso" | "ambientePadraoAula" | "imagemCapa">;

  //
  ...PickProperties<TurmaView, "dateCreated" | "dateUpdated" | "dateDeleted">;
}

/** Dados de entrada para a criação de uma Turma. */
@Metadata.EntityId(Tokens.Turma_InputCreate_View)
model TurmaInputCreateView {
  ...PickProperties<TurmaView, "periodo">;
  curso: CursoFindOneInputView;
  ambientePadraoAula: AmbienteFindOneInputView | null;
}

/** Dados de entrada para a atualização de uma Turma. */
@Metadata.EntityId(Tokens.Turma_InputUpdate_View)
model TurmaInputUpdateView is OptionalProperties<TurmaInputCreateView>;

/** Resultados da busca a Turmas. */
@Metadata.EntityId(Tokens.Turma_ListResult_View)
model TurmaListResultView is Pagination.Result.View<TurmaFindOneResultView>;
