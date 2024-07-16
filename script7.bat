@echo off
setlocal enabledelayedexpansion

rem Pergunta ao usuário por um quantitativo
set /p quant="Digite a quantidade: "

rem Pergunta ao usuário por um código
set /p code="Digite o codigo: "

rem Pergunta ao usuário por um número
set /p numero="Digite o numero: "

rem Pergunta ao usuário por um número de pavimentos
set /p pav="Digite a quantidade de pavimentos: "

echo 0-%code%-%numero%-0000-MMD-GER-Memorial Descritivo

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
        echo %%i-%code%-%numero%-00!teste!-PLA-!pavText!-Planta infraestrutura
    ) else (
        echo %%i-%code%-%numero%-000!teste!-PLA-!pavText!-Planta infraestrutura
    )

)

set /a nextIndex=pav+1


rem Loop para imprimir os índices com o código, número, número da planta e pavimento para distribuição
for /L %%i in (1, 1, %pav%) do (
    set /a currentIndex=nextIndex+%%i
    rem Decrementa a quantidade de pavimentos
    set /a pavCurrent=pav-%%i+1
	set /a teste=%%i

    rem Define o texto do pavimento
    if !pavCurrent! gtr 0 (
        set pavText=!pavCurrent!PAV
    ) else (
        set pavText="!pavCurrent!"
    )

    echo !currentIndex!-%code%-%numero%-000!currentIndex!-PLA-!pavText!-Planta distribuição
)

pause