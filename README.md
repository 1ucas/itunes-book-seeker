# Buscador de Livros na iTunes Store

Este é um aplicativo nativo iOS estilo showcase para testes / aplicações de funcionalidades.

Deve ser utilizado como consulta de implementações e referência de evolução das plataformas, framework e bibliotecas.

Não deve ser usado como "base" para nenhum projeto, mas sim como consulta porque é certo que irá apresentar mais funciondalidades do que esperado ou até alguns pontos de overengineering,

## Core:

Um aplicativo que faz a busca de uma lista de livros com base no termo pesquisado

## Funcionalidades:

- [x] Listar Livros
- [x] Exibir detalhes dos Livros
- [x] Gravar as pesquisas localmente

## Tecnologia / Stack:

- [x] Clean Architecture
- [x] MVVM-C
- [x] View - View Controllers + Storyboards (1x1)
- [x] Presenter - ViewModel (com propriedades reativas)
- [x] Router - Coordinators
- [x] Persistência - NSUserDefaults
- [x] Testes Unitários
- [x] Testes Testes de Integração (API)
- [x] Gerenciador de Dependências - Cocoapods

## Bibliotecas Utilizadas:

- [x] RxSwift
- [x] Kingfisher
- [x] Quick / Nimble
- [x] Alamofire

## Work in Progress (WIP):

- [ ] Pipeline - Em construção

## Trabalho Futuro (Roadmap):

- [ ] Analytics
- [ ] Modularização
- [ ] Persistência - CoreData
- [ ] Persistência - Realm
- [ ] Alamofire -> Moya
- [ ] Gerenciador de Dependências - Carthage + Pods
- [ ] Exibição - ViewCode + Storyboard
- [ ] Certificate Pinning
