using Ladesa.Domain.v4.Generics;
using Ladesa.Domain.v4.Generics.Entities;

namespace Ladesa.Domain.v4.Schemas;

/**
 * Visão completa de uma versão de uma imagem.
 */
model ImagemArquivoView {
  ...OmitProperties<ImagemArquivo, "imagem" | "arquivo">;
  imagem: ImagemFindOneFromImagemArquivoResultView;
  arquivo: ArquivoFindOneResultView;
}

/**
 * Dados de entrada para encontrar uma versão de uma imagem por ID.
 */
@Metadata.EntityId(Tokens.ImagemArquivo_FindOneInput_View)
model ImagemArquivoFindOneInputView {
  ...PickProperties<Imagem, "id">;
}

/**
 * Visão FindOne de uma versão de uma versão de imagem.
 */
@Metadata.EntityId(Tokens.ImagemArquivo_FindOneResult_View)
@Metadata.EntityPartialOfId(Tokens.ImagemArquivo_View)
model ImagemArquivoFindOneResultView {
  ...PickProperties<ImagemArquivoView, "id">;

  //

  ...PickProperties<
    ImagemArquivoView,
    "largura" | "altura" | "formato" | "mimeType"
  >;

  ...PickProperties<ImagemArquivoView, "imagem">;
  ...PickProperties<ImagemArquivoView, "arquivo">;

  //

  ...PickProperties<
    ImagemArquivoView,
    "dateCreated" | "dateUpdated" | "dateDeleted"
  >;
}

/**
 * Visão FindOneFromImagem de uma versão de imagem.
 */
@Metadata.EntityId(Tokens.ImagemArquivo_FindOneFromImagemResult_View)
@Metadata.EntityPartialOfId(Tokens.ImagemArquivo_View)
model ImagemArquivoFindOneFromImagemResultView {
  ...PickProperties<ImagemArquivoView, "id">;

  //

  ...PickProperties<
    ImagemArquivoView,
    "largura" | "altura" | "formato" | "mimeType"
  >;

  ...PickProperties<ImagemArquivoView, "arquivo">;

  //

  ...PickProperties<
    ImagemArquivoView,
    "dateCreated" | "dateUpdated" | "dateDeleted"
  >;
}
