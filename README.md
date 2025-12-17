Este repositório contém um arquivo .bat que auxilia a criar automaticamente múltiplos breakpoints/logs consecutivos no VSCode, gerando um arquivo breakpoints.json no formato esperado pela extensão BreakpointIO.

Exemplo de uso: marcar todas as linhas do intervalo 2 a 200 (ou qualquer outro intervalo) de forma automática.

Pré-requisitos
1) Instalar a extensão BreakpointIO no VSCode

Marketplace: https://marketplace.visualstudio.com/items?itemName=deckerio.breakpointio

GitHub: https://github.com/redspart/breakpoint-io

Observação: o arquivo VSIX também está disponível na pasta do projeto (para instalação offline, se necessário).

Como usar
1) Criar um atalho do Windows (recomendado)

Crie um atalho para o .bat e informe como primeiro parâmetro o caminho da sua pasta .vscode (onde o arquivo breakpoints.json será movido no final).

Exemplo (Target/Destino do atalho):

C:\Windows\System32\cmd.exe /c ""C:\CAMINHO\DO\PROJETO\montadebug.bat" "C:\git\.vscode""


Substitua C:\CAMINHO\DO\PROJETO\ pelo local real do seu .bat.

2) Executar o .bat

Ao executar, ele irá pedir:

Caminho do fonte a debugar (exemplo: /Automacao Comercial/LOJA120.PRW)

Linha inicial (exemplo: 1747)

Linha final (exemplo: 1828)

O script irá:

Gerar o breakpoints.json

Montar automaticamente os breakpoints para o intervalo solicitado

Mover o breakpoints.json para a pasta .vscode informada como parâmetro

3) Importar os breakpoints no VSCode (BreakpointIO)

No VSCode, pressione:

Ctrl + Shift + P
E execute o comando:

BreakpointIO: Import

Pronto — o intervalo de linhas informado já estará marcado com os logs/breakpoints via extensão.

Resultado esperado

Após a importação, todas as linhas do intervalo informado passam a estar “logadas”/marcadas automaticamente, evitando o trabalho manual de criar breakpoint por breakpoint.
