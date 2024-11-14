
# Luna

**Luna** é um aplicativo de segurança pessoal focado em auxiliar mulheres em situações de emergência, oferecendo funcionalidades como botão de emergência, IA ativa 24 horas por dia e um mapa de delegacias próximas.

## Índice

- [Descrição](#descrição)
- [Estrutura do Projeto](#estrutura-do-projeto)
- [Pré-requisitos](#pré-requisitos)
- [Instalação](#instalação)
- [Uso](#uso)
- [Funcionalidades](#funcionalidades)
- [Contribuição](#contribuição)
- [Licença](#licença)

## Descrição

Luna é um aplicativo de segurança pessoal desenvolvido para proporcionar proteção eficiente para mulheres. Ele permite a ativação rápida de um botão de emergência, possui uma inteligência artificial ativa para monitoramento contínuo, e conta com uma funcionalidade de mapa para localizar delegacias próximas. O projeto está construído em Flutter, suportando diversas plataformas (Android, iOS, Web, etc.).

## Estrutura do Projeto

A estrutura principal do repositório é organizada da seguinte forma:

- **lib/**: Diretório principal para arquivos do Flutter, incluindo:
  - **background_service.dart**: Serviço em segundo plano para manter o aplicativo sempre ativo.
  - **cadastro.dart**: Tela de cadastro para novas usuárias.
  - **contatos.dart**: Tela de gerenciamento de contatos de emergência.
  - **conf.dart**: Tela de configuração do aplicativo, onde a usuária pode ajustar preferências e permissões.
  - **inicial.dart**: Tela inicial com o logotipo do aplicativo.
  - **login.dart**: Tela de login.
  - **main.dart**: Arquivo principal para inicialização e configuração básica do aplicativo.
  - **monitoramento_botoes.dart**: Função de monitoramento dos botões de volume para acionamento do botão de emergência.
  - **services/database_helper.dart**: Configurações e interações com o banco de dados.
  
- **assets/**: Imagens e fontes utilizadas no aplicativo:
  - **fonts/**: Fontes personalizadas (`AbrilFatface.ttf`, `NotoSerifGeorgian.ttf`).
  - Ícones e imagens (`conf.png`, `contatos.png`, `home.png`, etc.) que são exibidos nas interfaces do app.

- **ios/**, **android/**, **web/**, **linux/**, **macos/**, **windows/**: Configurações e recursos específicos para cada plataforma.

- **test/**: Arquivo para testes de widgets, onde é possível adicionar casos de teste para validar a interface do usuário.

## Pré-requisitos

- **Flutter** SDK instalado na máquina.
- **SQLite** para gerenciamento de contatos e autenticação.
- APIs de Mapa (se necessário) para exibir delegacias próximas.

## Instalação

1. Clone o repositório:
   ```bash
   git clone https://github.com/seu-usuario/luna.git
   cd luna
   ```

2. Instale as dependências:
   ```bash
   flutter pub get
   ```

3. Compile e execute o aplicativo:
   ```bash
   flutter run
   ```

## Uso

As funcionalidades principais podem ser acessadas diretamente pela interface inicial. Após o login, a usuária pode:

- Acessar o **botão de emergência** configurável.

## Funcionalidades

- **Botão de Emergência**: Acionamento rápido para notificar contatos com a localização.
- **Gerenciamento de Contatos**: Adicione e organize contatos favoritos de emergência.

## Contribuição

1. Faça um fork do projeto e crie um novo branch para suas modificações.
2. Siga os padrões de código e comente mudanças significativas.
3. Abra um Pull Request explicando as melhorias ou correções.

## Licença

Este projeto é licenciado sob a licença MIT.
