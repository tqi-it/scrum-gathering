# Mentorize

## Ideia inicial do projeto
"Semana passada postei que meu time e eu construiríamos um produto em 5 dias. Hoje vim contar que nós conseguimooos!!!!

No gif já estamos vendo essa joinha 💎 e é com toda a alegria que apresento o

Mentorize! 👏

O App que nasceu no Scrum Gathering Rio 2023 e que vai conectar pessoas que querem receber e oferecer mentorias gratuitas [...]" - Karla Rennó

 Post orignal: https://www.linkedin.com/feed/update/urn:li:share:7041446269222805505

<p align="center">
  <img src="./assets/linked_in_post.gif" />
</p>

## Sobre
O Mentorize é um aplicativo que conecta indivíduos com mentores experientes em suas áreas de interesse. Com este aplicativo, os usuários podem encontrar mentores que oferecem orientação, aconselhamento e apoio para ajudá-los a alcançar seus objetivos profissionais.

  - **Stack**:
    - Front-end com Dart/Flutter;
    - Back-end com Java/Springboot;
    - Banco de dados com PostgreSQL
  - **Status**: 1.0.0+17.0


## Requisitos para desenvolvimento

- [VSCode](https://code.visualstudio.com/)
- [Docker / Docker Compose](https://www.docker.com/)

#### Extensões do VSCode
- [Docker](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-docker)
- [Remote Development](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.vscode-remote-extensionpack)
- [Dev Containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)

## Instalação

```bash
# Clone o projeto e acesse a pasta no VSCode
git clone https://github.com/tqi-it/scrum-gathering && cd scrum-gathering/ && code .

# Abra a paleta de comandos do VS Code:
Pressione Ctrl + Shift + P
# Pesquise e selecione "Reabrir no container" ou "Reopen in Container"
Dev Containers: Reopen in Container
# Aguarde o carregamento do container - leva algum tempo.
```

## Como usar

#### Desenvolvimento
Pela primeira vez abrindo o projeto após a etapa de Instalação:
```bash
# Se você não pode se conectar ao - Swagger UI http://localhost:9090/swagger-ui/index.html#/
# feche o VSCode e repita a etapa anterior da instalação

# Vá para a pasta do projeto Flutter
cd front/mentorme

# Instale as dependências do Flutter
flutter clean && flutter pub get

# Execute o aplicativo em modo de desenvolvimento (banco de dados local)
flutter run \
--dart-define=BASE_URL=:9090 \
--dart-define=COMPLEMENT=/ \
--dart-define=MENTORME_ENV=http://localhost \
--dart-define=DEV=true

# Execute o aplicativo em modo de produção
flutter run --dart-define=DEV=true

# Você pode limpar as dependências baixadas e os arquivos de build quando necessário
flutter clean
```
#### Exemplo de como buildar
Para acessar o ambiente de produção
```bash
# Vá para a pasta do projeto Flutter
cd front/mentorme

# Instale as dependências do Flutter
flutter clean && flutter pub get

# crie o build do aplicativo para Android:
flutter build apk
```
Nota: você pode obter mais informações sobre build e deploy nos links a seguir:
- [Android](https://docs.flutter.dev/deployment/android)
- [iOS](https://docs.flutter.dev/deployment/ios)

## Configuração

Para usar o seu próprio banco de dados em produção, altere as variáveis do arquivo
```bash
front/mentorme/lib/app/shared/data/api_constants.dart
```
um exemplo com os valores está comentado no mesmo arquivo.

## Como contribuir

Após clonar o projeto, crie uma nova branch do git
```bash
git checkout -b dev/exemplo
```
faça as alterações necessárias, então abra um [pull request.](https://github.com/tqi-it/scrum-gathering/pulls)

----

## Informações de licenciamento de código aberto
1. [TERMS](TERMS.md)
2. [LICENSE](LICENSE)
3. [CFPB Source Code Policy](https://github.com/cfpb/source-code-policy/)
