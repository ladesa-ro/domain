using Ladesa.Domain.v3.Generics;
using Ladesa.Domain.v3.Generics.Entities;

namespace Ladesa.Domain.v3.Schemas;

/**
 * Arquivo.
 */
@Metadata.EntityId(Tokens.Arquivo)
model Arquivo {
  ...EntityIdUuid;

  /** Nome do arquivo. */
  name: string | null;

  /** Formato do arquivo. */
  mimeType: string | null;

  /** Tamanho do arquivo (em bytes). */
  sizeBytes: integer | null;

  /** Estratégia de armazenamento do conteúdo. */
  storageType: string;

  ...EntityDated;
}

/**
 * Visão completa de um arquivo.
 */
@Metadata.EntityId(Tokens.Arquivo_View)
model ArquivoView {
  ...Arquivo;
}

/**
 * Dados de entrada para encontrar um arquivo por id.
 */
@Metadata.EntityId(Tokens.Arquivo_FindOneInput_View)
model ArquivoFindOneInputView {
  ...PickProperties<Arquivo, "id">;
}

/**
 * Dados de saída para encontrar um arquivo por id.
 */
@Metadata.EntityId(Tokens.Arquivo_FindOneResult_View)
@Metadata.EntityPartialOfId(Tokens.Arquivo_View)
model ArquivoFindOneResultView {
  ...PickProperties<ArquivoView, "id">;

  //

  ...PickProperties<
    ArquivoView,
    "name" | "mimeType" | "sizeBytes" | "storageType"
  >;

  //

  ...PickProperties<ArquivoView, "dateCreated" | "dateUpdated" | "dateDeleted">;
}
