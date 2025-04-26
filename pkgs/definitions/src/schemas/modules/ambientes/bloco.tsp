using Ladesa.Domain.v4.Generics;
using Ladesa.Domain.v4.Generics.Entities;

namespace Ladesa.Domain.v4.Schemas;

/** Bloco. */
@Metadata.EntityId(Tokens.Bloco)
model Bloco {
  ...EntityIdUuid;

  /** Nome do Bloco. */
  @minLength(1)
  nome: string;

  /** Código do Bloco. */
  @minLength(1)
  codigo: string;

  /** Campus. */
  campus: Campus;

  /** Imagem de capa. */
  imagemCapa: Imagem | null;

  /** Ambientes. */
  ambientes: Ambiente[];

  ...EntityDated;
}

/** Visão completa de um bloco. */
@Metadata.EntityId(Tokens.Bloco_View)
model BlocoView {
  ...OmitProperties<Bloco, "campus" | "ambientes" | "imagemCapa">;
  campus: CampusFindOneResultView;
  imagemCapa: ImagemFindOneResultView | null;
  ambientes: AmbienteFindOneResultView[];
}

/**
 * Dados de entrada para encontrar um bloco por id.
 */
@Metadata.EntityId(Tokens.Bloco_FindOneInput_View)
model BlocoFindOneInputView {
  @Metadata.Constraints.EntityExists(Tokens.Bloco)
  id: Bloco.id;
}

/**
 * Visão FindOne de um bloco.
 */
@Metadata.EntityId(Tokens.Bloco_FindOneResult_View)
@Metadata.EntityPartialOfId(Tokens.Bloco_View)
model BlocoFindOneResultView {
  //
  ...PickProperties<BlocoView, "id">;

  ...PickProperties<BlocoView, "nome">;
  ...PickProperties<BlocoView, "codigo">;

  //
  ...PickProperties<BlocoView, "campus">;

  ...PickProperties<BlocoView, "imagemCapa">;

  //
  ...PickProperties<BlocoView, "dateCreated" | "dateUpdated" | "dateDeleted">;
}

/** Dados de entrada para a criação de um bloco. */
@Metadata.EntityId(Tokens.Bloco_InputCreate_View)
model BlocoInputCreateView {
  ...PickProperties<BlocoView, "nome">;
  ...PickProperties<BlocoView, "codigo">;
  campus: CampusFindOneInputView;
}

/** Dados de entrada para a atualização de um bloco. */
@Metadata.EntityId(Tokens.Bloco_InputUpdate_View)
model BlocoInputUpdateView is OptionalProperties<BlocoInputCreateView>;

/** Resultados da busca a blocos. */
@Metadata.EntityId(Tokens.Bloco_ListResult_View)
model BlocoListResultView is Pagination.Result.View<BlocoFindOneResultView>;
