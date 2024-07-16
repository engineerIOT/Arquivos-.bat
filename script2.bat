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

rem Loop para imprimir os índices com o código, número, número da planta e pavimento
for /L %%i in (1, 1, %quant%) do (
    rem Formata o número da planta com zeros à esquerda
    set "numPlantaPadded=0000%%i"
    set "numPlantaPadded=!numPlantaPadded:~-4!"

    rem Decrementa a quantidade de pavimentos
    set /a pavCurrent=pav-%%i+1

    rem Define o texto do pavimento
    if !pavCurrent! gtr 0 (
        set pavText=!pavCurrent!PAV
    ) else (
        set pavText="Sem pavimento"
    )

    echo %%i-%code%-%numero%-%numPlantaPadded%-PLA-!pavText!-Planta infraestrutura
)

pause