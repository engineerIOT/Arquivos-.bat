@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion

rem Pergunta ao usuário por um código
set /p code="Digite o codigo: "

rem Pergunta ao usuário por um número
set /p numero="Digite o numero: "

rem Pergunta ao usuário por um número de pavimentos
set /p pav="Digite a quantidade de pavimentos: "

rem Redireciona a saída para um arquivo
set outputFile=%code%-%numero%.txt

rem Verifica se o arquivo já existe e adiciona um sufixo numérico se necessário
set count=1
set baseOutputFile=%outputFile%
if exist %outputFile% (
    :checkFile
    set outputFile=%baseOutputFile:~0,-4%_%count%.txt
    if exist %outputFile% (
        set /a count+=1
        goto checkFile
    )
)

(echo %code%-%numero%-0000-MMD-GER-Memorial Descritivo) > %outputFile%

rem Loop para imprimir os índices com o código, número, número da planta e pavimento para infraestrutura
for /L %%i in (1, 1, %pav%) do (
    rem Decrementa a quantidade de pavimentos
    set /a pavCurrent=pav-%%i+1
    set /a teste=%%i

    rem Define o texto do pavimento
    if !pavCurrent! gtr 0 (
        set pavText=!pavCurrent!PAV
    ) else (
        set pavText="!pavCurrent!"
    )

    rem Formata o número da planta com quatro dígitos, preenchendo com zeros à esquerda
    if !teste! gtr 9 (
        (echo %code%-%numero%-00!teste!-PLA-!pavText!-Planta infraestrutura) >> %outputFile%
    ) else (
        (echo %code%-%numero%-000!teste!-PLA-!pavText!-Planta infraestrutura) >> %outputFile%
    )
)

set /a nextIndex=pav+1

rem Loop para imprimir os índices com o código, número, número da planta e pavimento para distribuição
for /L %%i in (1, 1, %pav%) do (
    set /a currentIndex=nextIndex+%%i
    rem Decrementa a quantidade de pavimentos
    set /a pavCurrent=pav-%%i+1
    set /a teste=currentIndex-1

    rem Define o texto do pavimento
    if !pavCurrent! gtr 0 (
        set pavText=!pavCurrent!PAV
    ) else (
        set pavText="!pavCurrent!"
    )
    
    rem Formata o número da planta com quatro dígitos, preenchendo com zeros à esquerda
    if !teste! gtr 9 (
        (echo %code%-%numero%-00!teste!-PLA-!pavText!-Planta distribuição) >> %outputFile%
    ) else (
        (echo %code%-%numero%-000!teste!-PLA-!pavText!-Planta distribuição) >> %outputFile%
    )
)

rem Formata o número da planta com quatro dígitos, preenchendo com zeros à esquerda
if !currentIndex! gtr 9 (
    (echo %code%-%numero%-00%currentIndex%-GER-Planta Detalhamento) >> %outputFile%
) else (
    (echo %code%-%numero%-000%currentIndex%-GER-Planta Detalhamento) >> %outputFile%
)

rem Abre o arquivo recém-gerado
start notepad %outputFile%

pause
