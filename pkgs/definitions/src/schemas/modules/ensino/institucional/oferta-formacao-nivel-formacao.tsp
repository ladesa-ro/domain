using Ladesa.Domain.v3.Generics;
using Ladesa.Domain.v3.Generics.Entities;

namespace Ladesa.Domain.v3.Schemas;

/** OfertaFormacaoNivelFormacao. */
@Metadata.EntityId(Tokens.OfertaFormacaoNivelFormacao)
model OfertaFormacaoNivelFormacao {
  ...EntityIdUuid;

  /** Oferta de formação. */
  ofertaFormacao: OfertaFormacao;

  /** Nível de formação. */
  nivelFormacao: NivelFormacao;

  ...EntityDated;
}

/** Visão completa de uma oferta de formação. */
@Metadata.EntityId(Tokens.OfertaFormacaoNivelFormacao_View)
model OfertaFormacaoNivelFormacaoView {
  ...OmitProperties<
    OfertaFormacaoNivelFormacao,
    "ofertaFormacao" | "nivelFormacao"
  >;
  ofertaFormacao: OfertaFormacaoFindOneResultView;
  nivelFormacao: NivelFormacaoFindOneResultView;
}

/** Dados de entrada para encontrar uma oferta de formação por ID. */
@Metadata.EntityId(Tokens.OfertaFormacaoNivelFormacao_FindOneInput_View)
model OfertaFormacaoNivelFormacaoFindOneInputView {
  @Metadata.Constraints.EntityExists(Tokens.OfertaFormacaoNivelFormacao)
  id: OfertaFormacaoNivelFormacao.id;
}

/** Visão FindOne de uma oferta de formação. */
@Metadata.EntityId(Tokens.OfertaFormacaoNivelFormacao_FindOneResult_View)
@Metadata.EntityPartialOfId(Tokens.OfertaFormacaoNivelFormacao_View)
model OfertaFormacaoNivelFormacaoFindOneResultView {
  ...PickProperties<OfertaFormacaoNivelFormacaoView, "id">;
  ...PickProperties<
    OfertaFormacaoNivelFormacaoView,
    "ofertaFormacao" | "nivelFormacao"
  >;
  ...PickProperties<
    OfertaFormacaoNivelFormacaoView,
    "dateCreated" | "dateUpdated" | "dateDeleted"
  >;
}

/** Dados de entrada para a criação de uma oferta de formação. */
@Metadata.EntityId(Tokens.OfertaFormacaoNivelFormacao_InputCreate_View)
model OfertaFormacaoNivelFormacaoInputCreateView {
  ofertaFormacao: OfertaFormacaoFindOneInputView;
  nivelFormacao: NivelFormacaoFindOneInputView;
}

/** Dados de entrada para a atualização de uma oferta de formação. */
@Metadata.EntityId(Tokens.OfertaFormacaoNivelFormacao_InputUpdate_View)
model OfertaFormacaoNivelFormacaoInputUpdateView
  is OptionalProperties<OfertaFormacaoNivelFormacaoInputCreateView>;

/** Resultados da busca a OfertaFormacaoNivelFormacaos. */
@Metadata.EntityId(Tokens.OfertaFormacaoNivelFormacao_ListResult_View)
model OfertaFormacaoNivelFormacaoListResultView
  is Pagination.Result.View<OfertaFormacaoNivelFormacaoFindOneResultView>;
