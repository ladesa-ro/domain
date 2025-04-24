using TypeSpec.JsonSchema;

using Ladesa.v3.Generics;
using Ladesa.v3.Generics.Entities;
using Ladesa.Schemas.Pagination.Result;

namespace Ladesa.v3.Schemas;

/** Ambiente. */
@Metadata.EntityId(Tokens.Ambiente)
model Ambiente {
  ...EntityIdUuid;

  /** Nome do ambiente/sala. */
  @minLength(1)
  nome: string;

  /** Descrição do ambiente/sala. */
  descricao: string | null;

  /** Código do ambiente/sala. */
  @minLength(1)
  codigo: string;

  /** Capacidade do ambiente/sala. */
  capacidade: integer | null;

  /** Tipo do ambiente/sala. Ex.: sala aula, auditório, laboratório de química. */
  tipo: string | null;

  /** Bloco que o ambiente/sala pertence. */
  bloco: Bloco;

  /** Imagem de capa. */
  imagemCapa: Imagem | null;

  ...EntityDated;
}

/** Visão completa de um ambiente. */
@Metadata.EntityId(Tokens.Ambiente_View)
model AmbienteView {
  ...OmitProperties<Ambiente, "bloco" | "imagemCapa">;
  bloco: BlocoFindOneResultView;
  imagemCapa: ImagemFindOneResultView | null;
}

/**
 * Dados de entrada para encontrar um ambiente por id.
 */
@Metadata.EntityId(Tokens.Ambiente_FindOneInput_View)
model AmbienteFindOneInputView {
  @extension("x-unispec-constraint-entity-exists", Json<Tokens.Ambiente>)
  id: Ambiente.id;
}

/**
 * Visão FindOne de um ambiente.
 */
@Metadata.EntityId(Tokens.Ambiente_FindOneResult_View)
@Metadata.EntityPartialOfId(Tokens.Ambiente_View)
model AmbienteFindOneResultView {
  //
  ...PickProperties<AmbienteView, "id">;

  ...PickProperties<AmbienteView, "nome">;
  ...PickProperties<AmbienteView, "descricao">;
  ...PickProperties<AmbienteView, "codigo">;
  ...PickProperties<AmbienteView, "capacidade">;
  ...PickProperties<AmbienteView, "tipo">;

  //
  ...PickProperties<AmbienteView, "bloco">;

  ...PickProperties<AmbienteView, "imagemCapa">;

  //
  ...PickProperties<
    AmbienteView,
    "dateCreated" | "dateUpdated" | "dateDeleted"
  >;
}

/** Dados de entrada para a criação de um ambiente. */
@Metadata.EntityId(Tokens.Ambiente_InputCreate_View)
model AmbienteInputCreateView {
  ...PickProperties<AmbienteView, "nome">;
  ...PickProperties<AmbienteView, "descricao">;
  ...PickProperties<AmbienteView, "codigo">;
  ...PickProperties<AmbienteView, "capacidade">;
  ...PickProperties<AmbienteView, "tipo">;
  bloco: BlocoFindOneInputView;
}

/** Dados de entrada para a atualização de um ambiente. */
@Metadata.EntityId(Tokens.Ambiente_InputUpdate_View)
model AmbienteInputUpdateView is OptionalProperties<AmbienteInputCreateView>;

/** Resultados da busca a ambientes. */
@Metadata.EntityId(Tokens.Ambiente_ListResult_View)
model AmbienteListResultView is PaginationResultView<AmbienteFindOneResultView>;
