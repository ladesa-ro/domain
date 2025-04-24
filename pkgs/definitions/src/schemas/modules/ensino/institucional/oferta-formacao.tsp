using TypeSpec.JsonSchema;

using Ladesa.v3.Generics;
using Ladesa.v3.Generics.Entities;
using Ladesa.Schemas.Pagination.Result;

namespace Ladesa.v3.Schemas;

/** OfertaFormacao. */
@Metadata.EntityId(Tokens.OfertaFormacao)
model OfertaFormacao {
  ...EntityIdUuid;

  /** Nome da oferta de formação. */
  @minLength(1)
  nome: string;

  /** Apelido da oferta de formação. */
  @minLength(1)
  slug: string;

  /** Modalidade da oferta de formação. */
  modalidade: Modalidade;

  /** Array de relações entre a oferta e níveis de formações. */
  ofertaFormacaoNiveisFormacoes: OfertaFormacaoNivelFormacao[];

  ...EntityDated;
}

/** Visão completa de uma oferta de formação. */
@Metadata.EntityId(Tokens.OfertaFormacao_View)
model OfertaFormacaoView {
  ...OmitProperties<
    OfertaFormacao,
    "modalidade" | "ofertaFormacaoNiveisFormacoes"
  >;

  /** Modalidade da oferta de formação. */
  modalidade: ModalidadeFindOneResultView;

  /** Array de relações entre a oferta e níveis de formações. */
  ofertaFormacaoNiveisFormacoes: OfertaFormacaoNivelFormacao[];

  /** Níveis de formações vinculados */
  niveisFormacoes: NivelFormacao[];
}

/** Dados de entrada para encontrar uma oferta de formação por ID. */
@Metadata.EntityId(Tokens.OfertaFormacao_FindOneInput_View)
model OfertaFormacaoFindOneInputView {
  @extension("x-unispec-constraint-entity-exists", Json<Tokens.OfertaFormacao>)
  id: OfertaFormacao.id;
}

/** Visão FindOne de uma oferta de formação. */
@Metadata.EntityId(Tokens.OfertaFormacao_FindOneResult_View)
@Metadata.EntityPartialOfId(Tokens.OfertaFormacao_View)
model OfertaFormacaoFindOneResultView {
  ...PickProperties<OfertaFormacaoView, "id">;
  ...PickProperties<OfertaFormacaoView, "nome">;
  ...PickProperties<OfertaFormacaoView, "slug">;
  ...PickProperties<OfertaFormacaoView, "modalidade">;
  ...PickProperties<
    OfertaFormacaoView,
    "dateCreated" | "dateUpdated" | "dateDeleted"
  >;
}

/** Dados de entrada para a criação de uma oferta de formação. */
@Metadata.EntityId(Tokens.OfertaFormacao_InputCreate_View)
model OfertaFormacaoInputCreateView {
  ...PickProperties<OfertaFormacaoView, "nome">;
  ...PickProperties<OfertaFormacaoView, "slug">;

  /** Modalidade da oferta de formação. */
  modalidade: ModalidadeFindOneInputView;
}

/** Dados de entrada para a atualização de uma oferta de formação. */
@Metadata.EntityId(Tokens.OfertaFormacao_InputUpdate_View)
model OfertaFormacaoInputUpdateView
  is OptionalProperties<OfertaFormacaoInputCreateView>;

/** Resultados da busca a OfertaFormacaos. */
@Metadata.EntityId(Tokens.OfertaFormacao_ListResult_View)
model OfertaFormacaoListResultView
  is PaginationResultView<OfertaFormacaoFindOneResultView>;
