using Ladesa.v3.Generics;
using Ladesa.v3.Generics.Entities;

namespace Ladesa.v3.Schemas;

/**
 * ImagemArquivo.
 */
@Metadata.EntityId(Tokens.ImagemArquivo)
model ImagemArquivo {
  ...EntityIdUuid;

  /** Largura da imagem. */
  largura: integer;

  /** Altura da imagem. */
  altura: integer;

  /** Formato da imagem. */
  formato: string;

  /** Mime-type da imagem. */
  mimeType: string;

  /** Imagem. */
  imagem: Imagem;

  /** Arquivo. */
  arquivo: Arquivo;

  ...EntityDated;
}

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
