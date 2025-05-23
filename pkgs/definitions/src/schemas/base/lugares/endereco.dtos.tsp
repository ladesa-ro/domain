using Ladesa.Domain.v4.Generics;
using Ladesa.Domain.v4.Generics.Entities;

namespace Ladesa.Domain.v4.Schemas;

/** Visão completa de um endereco. */
@Metadata.EntityId(Tokens.Endereco_View)
model EnderecoView {
  ...OmitProperties<Endereco, "cidade">;
  cidade: CidadeFindOneResultView;
}

/**
 * Dados de entrada para encontrar um endereço por id.
 */
@Metadata.EntityId(Tokens.Endereco_FindOneInput_View)
model EnderecoFindOneInputView is PickProperties<EnderecoView, "id">;

/**
 * Visão FindOne de um endereço.
 */
@Metadata.EntityId(Tokens.Endereco_FindOneResult_View)
@Metadata.EntityPartialOfId(Tokens.Endereco_View)
model EnderecoFindOneResultView {
  //
  ...PickProperties<EnderecoView, "id">;

  ...PickProperties<EnderecoView, "cep">;
  ...PickProperties<EnderecoView, "logradouro">;
  ...PickProperties<EnderecoView, "numero">;
  ...PickProperties<EnderecoView, "bairro">;
  ...PickProperties<EnderecoView, "complemento">;
  ...PickProperties<EnderecoView, "pontoReferencia">;

  //
  ...PickProperties<EnderecoView, "cidade">;

  //
  ...PickProperties<
    EnderecoView,
    "dateCreated" | "dateUpdated" | "dateDeleted"
  >;
}

/**
 * Dados de entrada para um endereco.
 */
@Metadata.EntityId(Tokens.Endereco_Input_View)
model EnderecoInput {
  ...PickProperties<EnderecoView, "cep">;
  ...PickProperties<EnderecoView, "logradouro">;
  ...PickProperties<EnderecoView, "numero">;
  ...PickProperties<EnderecoView, "bairro">;
  ...PickProperties<EnderecoView, "complemento">;
  ...PickProperties<EnderecoView, "pontoReferencia">;
  cidade: CidadeFindOneInputView;
}
