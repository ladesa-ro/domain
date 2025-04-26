<h1 align="center">Domínio da Informação</h1>

<p align="center">Definição de dados e entidades do Ladesa</p>

<div align="center">
  <a href="https://github.com/ladesa-ro/domain">
    <img alt="Repositório de Código no GitHub" src="https://img.shields.io/badge/GitHub-Domain-118d3b?style=for-the-badge&logo=GitHub&logoColor=white&labelColor=18181b&color=118d3b" />
  </a>
  <a href="https://docs.ladesa.com.br/developers/">
    <img alt="Documentação" src="https://img.shields.io/badge/DOCS.LADESA-118d3b?style=for-the-badge&logo=readme&logoColor=white&label=Documenta%C3%A7%C3%A3o&labelColor=18181b" />
  </a>
</div>

## 🚀 O que você encontra aqui

### Definições de Entidades

Tudo sobre as entidades do Ladesa, suas propriedades e como se relacionam.

### Dados de Comunicação

Formatos e estruturas dos dados para comunicação entre sistemas.

### Artefatos de Integração

[Esquemas JSON](./pkgs/integrations/json-schema/lib/Ladesa.Domain.v4.json), pacotes para [C# (NuGet)](#integração-c--dotnet) e [JavaScript/TypeScript (NPM)](#integração-typescript--javascript), todos [gerados automaticamente][ladesa-domain-repo-automation].

## 👽 O quê este projeto não é

Você não encontra neste repositório as informações de como consumir e integrar aos nossos serviços em si. Para isso, indicamos que você consulte a documentação [Conectar — Ladesa Dev Docs](https://docs.ladesa.com.br/developers/connect/).

Dessa forma, esta especificação foca em definir quais são os dados e informações pertinentes aos nossos sistemas de maneira detalhada.

## 🧭 Por onde começar?

Para começar a trabalhar com a Especificação do Ladesa, siga estes passos:

- **Entender os sistemas do Ladesa:** Consulte a [documentação essencial para desenvolvedores][ladesa-docs-dev] para entender os conceitos fundamentais de nossos projetos.

- **Consumir a especificação:** Veja como você pode integrar as modelagens das entidades em seus sistemas, consultando a seção [💖 Utilização](#-utilização).

- **Obter o Código-fonte:** [Clone o repositório](#obter-o-código-fonte) e familiarize-se com a estrutura do projeto.

- **Configurar o Ambiente de Desenvolvimento:** Siga as instruções na seção de [🧑‍💻 Desenvolvimento Local](#-desenvolvimento-local) para configurar seu ambiente de trabalho.

- **Contribuir:** Veja como você pode ajudar a melhorar a especificação, consultando a seção [😊 Como Contribuir](#-como-contribuir).

## Conteúdo

<!-- TOC start (generated with https://github.com/derlin/bitdowntoc) -->

- [💖 Utilização](#-utilização)
  - [Integração C# / DotNet](#integração-c--dotnet)
    - [Instalar o pacote para dotnet](#instalar-o-pacote-para-dotnet)
    - [Utilizar o pacote para dotnet](#utilizar-o-pacote-para-dotnet)
  - [Integração TypeScript / JavaScript](#integração-typescript--javascript)
    - [Instalar o pacote para TypeScript / JavaScript](#instalar-o-pacote-para-typescript--javascript)
    - [Utilizar o pacote para TypeScript / JavaScript](#utilizar-o-pacote-para-typescript--javascript)
- [🧑‍💻 Desenvolvimento Local](#-desenvolvimento-local)
  - [Pré-requisitos](#pré-requisitos)
  - [Obter o código-fonte](#obter-o-código-fonte)
  - [Instalar as dependências](#instalar-as-dependências)
  - [Estrutura do projeto](#estrutura-do-projeto)
  - [Gerar os artefatos da especificação](#gerar-os-artefatos-da-especificação)
  - [Comandos](#comandos)
- [😊 Como Contribuir](#-como-contribuir)
  - [1. Reportar Problemas](#1-reportar-problemas)
  - [2. Sugerir Melhorias](#2-sugerir-melhorias)
  - [3. Fazer um Pull Request](#3-fazer-um-pull-request)
  - [4. Revisar Pull Requests](#4-revisar-pull-requests)
- [👋 Contato](#-contato)
- [🤝 Licença](#-licença)

<!-- TOC end -->

## 💖 Utilização

A Especificação do Ladesa pode ser utilizada por:

- **Desenvolvedores:** Para criar e manter aplicações que fazem parte do ecossistema Ladesa, garantindo que os aplicativos sigam as mesmas regras de dados e integração.

- **Integradores:** Para desenvolver integrações entre sistemas existentes e o Ladesa, assegurando interoperabilidade e conformidade com padrões estabelecidos.

- **Analistas de Sistemas:** Para entender como os dados são modelados e gerenciados dentro do ecossistema Ladesa.

### Integração C# / DotNet

[![NuGet Package][nuget-package-src]][nuget-package-href] [![NuGet Stable Version][nuget-package-stable-version-src]][nuget-package-versions-href]

#### Instalar o pacote para dotnet

```sh
dotnet add package Ladesa.Domain.v4
```

#### Utilizar o pacote para dotnet

- Utilização do namespace `Ladesa.Domain.v4`

```cs
using Ladesa.Domain.v4;
```

- Conversão de uma `string` `JSON` para uma instância de alguma das classes

```cs
Arquivo arquivo = Arquivo.FromJson(jsonString);
```

### Integração TypeScript / JavaScript

[![NPM Package][npm-package-src]][npm-package-href] [![NPM Stable Version][npm-package-stable-version-src]][npm-package-versions-href]

#### Instalar o pacote para TypeScript / JavaScript

```sh
# npm
npm install @ladesa-ro/domain.v4

# pnpm
pnpm add @ladesa-ro/domain.v4

# yarn
yarn add @ladesa-ro/domain.v4
```

#### Utilizar o pacote para TypeScript / JavaScript

```ts
import type {} from "@ladesa-ro/domain.v4";
```

## 🧑‍💻 Desenvolvimento Local

Para você realizar o desenvolvimento local, preparamos o guia a seguir.

### Pré-requisitos

Para o desenvolvimento local, é necessário preparar o seu ambiente de trabalho para mexer com este projeto.

Preparamos dicas e tutoriais para você acerca de cada pré-requisito, basta clicar nos links para saber mais.

- linux ou wsl, com [acesso à linha de comando bash](https://docs.ladesa.com.br/developers/tutorials/os/command-line/);
- [git](https://docs.ladesa.com.br/developers/tutorials/source-code/git/);
- [bun](https://bun.sh/)

<!-- - [podman] -->

### Obter o código-fonte

O primeiro passo para o desenvolvimento local é de obter uma cópia dos arquivos deste repositório. Para isso, digite:

```sh
git clone https://github.com/ladesa-ro/domain.git
cd domain
```

### Instalar as dependências

```sh
bun install
```

### Estrutura do projeto

O projeto está organizado da seguinte forma:

- pkgs/definitions: especificação feita com typespec
- pkgs/integrations: pacotes gerados automaticamente para outras plataformas relevantes

### Gerar os artefatos da especificação

```sh
bun run all:generate
```

### Comandos

Todos os comandos são executados a partir da raiz do projeto, em um terminal:

| Comando                | Ação                                |
| :--------------------- | :---------------------------------- |
| `bun install`          | Instala as dependências.            |
| `bun run all:generate` | Gera os artefatos da especificação. |
| `bun run all:code:fix` | Correção de lint e formatação.      |

<details>

<summary>Outros comandos</summary>

| Comando                    | Ação                                                |
| :------------------------- | :-------------------------------------------------- |
| `bun run all:lint:check`   | Checa as regras do lint.                            |
| `bun run all:lint:fix`     | Corrige erros resolviveis de lint.                  |
| `bun run all:format:check` | Checa as formatações dos arquivos.                  |
| `bun run all:format:fix`   | Corrige as formatações inconsistêntes dos arquivos. |
| `bun run all:code:check`   | Checagem de lint e formatação.                      |

</details>

## 😊 Como Contribuir

Este projeto é open source, e contribuições são sempre bem-vindas! Existem diversas formas de você colaborar com a Especificação do Ladesa:

### 1. Reportar Problemas

Se você encontrou algum problema ou erro na especificação, por favor, abra uma [issue no GitHub][ladesa-domain-issues]. Detalhe o máximo possível para que possamos investigar e resolver rapidamente.

### 2. Sugerir Melhorias

Tem uma ideia para melhorar a especificação? Sinta-se à vontade para sugerir novas funcionalidades, ajustes ou correções abrindo uma [issue][ladesa-domain-issues] ou discutindo na [Ladesa Community][ladesa-docs-community].

### 3. Fazer um Pull Request

Se você já tem uma solução para um problema ou deseja propor uma melhoria no código, siga os passos abaixo para enviar um **pull request**:

1. **Faça um fork** deste repositório.
2. **Clone o repositório** em sua máquina local.
3. Crie uma **branch** com o nome da sua funcionalidade ou correção.
4. Faça as alterações necessárias.
5. Envie um **pull request** detalhando o que foi alterado e por que.

### 4. Revisar Pull Requests

Se você tiver experiência com o projeto, pode ajudar revisando e sugerindo melhorias nos pull requests abertos por outros colaboradores. A revisão cuidadosa ajuda a garantir que o código mantido esteja sempre em alta qualidade.

> Lembre-se de seguir o [código de conduta][ladesa-domain-repo-code-of-conduct] da comunidade em todas as interações.

## 👋 Contato

Se você tiver dúvidas, sugestões ou precisar de ajuda, entre em contato conosco:

- **Email:** `em breve`.
- **Comunidade:** Participe de discussões e interações na comunidade do Ladesa através do [Ladesa Community][ladesa-docs-community].
- **GitHub Issues:** Para relatar bugs ou sugerir melhorias, utilize a seção de [Issues do GitHub][ladesa-domain-issues].

## 🤝 Licença

[MIT](./LICENSE) © 2024 – presente, Ladesa.

---

⭐ Marque este repositório com estrela se achar útil!

<!-- Links -->

<!-- Links / Docs -->

[ladesa-docs-community]: https://docs.ladesa.com.br/community
[ladesa-docs-dev]: https://docs.ladesa.com.br/developers

<!-- Links / Especificação -->

[ladesa-domain-issues]: https://github.com/ladesa-ro/domain/issues
[ladesa-domain-repo-automation]: https://github.com/ladesa-ro/domain/tree/main/.github/workflows
[ladesa-domain-repo-code-of-conduct]: https://github.com/ladesa-ro/domain/blob/main/CODE_OF_CONDUCT.md

<!-- Badges -->

<!-- Badges / Integrations / NPM -->

[npm-package-src]: https://img.shields.io/badge/npm-%40ladesa--ro%2Fdomain-18181B?style=flat&logo=npm&logoColor=white&labelColor=%23CB3837
[npm-package-href]: https://npmjs.com/package/@ladesa-ro/domain.v4

<!-- Badges / Integrations / NPM / Versions -->

[npm-package-versions-href]: https://www.npmjs.com/package/@ladesa-ro/domain.v4?activeTab=versions
[npm-package-stable-version-src]: https://img.shields.io/badge/dynamic/json?url=https%3A%2F%2Fregistry.npmjs.com%2F%40ladesa-ro%2Fdomain&query=%24%5B%22dist-tags%22%5D.latest&prefix=v&style=flat&logo=npm&logoColor=white&label=versão&style=flat&colorA=18181B&colorB=white

<!-- Badges / Integrations / NuGet -->

[nuget-package-src]: https://img.shields.io/badge/nuget-Ladesa.Domain.v4-18181B?style=flat&logo=nuget&logoColor=white&labelColor=%23004880
[nuget-package-href]: https://www.nuget.org/packages/Ladesa.Domain.v4/

<!-- Badges / Integrations / NuGet / Versions -->

[nuget-package-versions-href]: https://www.nuget.org/packages/Ladesa.Domain.v4#versions-body-tab
[nuget-package-stable-version-src]: https://img.shields.io/nuget/v/Ladesa.Domain.v4?style=flat&style=flat&logo=nuget&logoColor=white&label=versão&style=flat&colorA=18181B&colorB=white
