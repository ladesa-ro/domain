using Ladesa.Domain.v4.Generics;
using Ladesa.Domain.v4.Generics.Entities;

namespace Ladesa.Domain.v4.Schemas;

/** Visão completa de um Curso. */
@Metadata.EntityId(Tokens.Curso_View)
model CursoView {
  ...OmitProperties<Curso, "campus" | "ofertaFormacao" | "imagemCapa">;
  campus: CampusFindOneResultView;
  ofertaFormacao: OfertaFormacaoFindOneResultView;
  imagemCapa: ImagemFindOneResultView | null;
}

/** Dados de entrada para encontrar um Curso por ID. */
@Metadata.EntityId(Tokens.Curso_FindOneInput_View)
model CursoFindOneInputView {
  @Metadata.Constraints.EntityExists(Tokens.Curso)
  id: Curso.id;
}

/** Visão FindOne de um Curso. */
@Metadata.EntityId(Tokens.Curso_FindOneResult_View)
@Metadata.EntityPartialOfId(Tokens.Curso_View)
model CursoFindOneResultView {
  //
  ...PickProperties<CursoView, "id">;

  ...PickProperties<CursoView, "nome" | "nomeAbreviado">;

  //
  ...PickProperties<CursoView, "campus" | "ofertaFormacao" | "imagemCapa">;

  //
  ...PickProperties<CursoView, "dateCreated" | "dateUpdated" | "dateDeleted">;
}

/** Dados de entrada para a criação de um Curso. */
@Metadata.EntityId(Tokens.Curso_InputCreate_View)
model CursoInputCreateView {
  ...PickProperties<CursoView, "nome" | "nomeAbreviado">;
  campus: CampusFindOneInputView;
  ofertaFormacao: OfertaFormacaoFindOneInputView;
}

/** Dados de entrada para a atualização de um Curso. */
@Metadata.EntityId(Tokens.Curso_InputUpdate_View)
model CursoInputUpdateView is OptionalProperties<CursoInputCreateView>;

/** Resultados da busca a Cursos. */
@Metadata.EntityId(Tokens.Curso_ListResult_View)
model CursoListResultView is Pagination.Result.View<CursoFindOneResultView>;
