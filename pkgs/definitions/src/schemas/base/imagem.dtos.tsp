using Ladesa.Domain.v4.Generics;
using Ladesa.Domain.v4.Generics.Entities;

namespace Ladesa.Domain.v4.Schemas;

/**
 * Visão completa de uma Imagem.
 */
@Metadata.EntityId(Tokens.Imagem_View)
model ImagemView {
  ...OmitProperties<Imagem, "versoes">;
  versoes: ImagemArquivoFindOneFromImagemResultView[];
}

/**
 * Dados de entrada para encontrar uma imagem por ID.
 */
@Metadata.EntityId(Tokens.Imagem_FindOneInput_View)
model ImagemFindOneInputView {
  ...PickProperties<Imagem, "id">;
}

/**
 * Visão FindOne de uma imagem.
 */
@Metadata.EntityId(Tokens.Imagem_FindOneResult_View)
@Metadata.EntityPartialOfId(Tokens.Imagem_View)
model ImagemFindOneResultView {
  //
  ...PickProperties<ImagemView, "id">;

  ...PickProperties<ImagemView, "descricao">;
  ...PickProperties<ImagemView, "versoes">;

  //
  ...PickProperties<ImagemView, "dateCreated" | "dateUpdated" | "dateDeleted">;
}

/**
 * Visão FindOneFromImagemArquivo de uma imagem.
 */
@Metadata.EntityId(Tokens.Imagem_FindOneFromImagemArquivoResult_View)
@Metadata.EntityPartialOfId(Tokens.Imagem_View)
model ImagemFindOneFromImagemArquivoResultView {
  ...PickProperties<ImagemView, "id">;
}
