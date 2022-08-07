# Alv_Event_Hotspot
Relatório Alv simples com Evento Hotspot(ABAP).


    1 - A tela de de Seleção deve Ter:
        Documento(vbak-vbeln);
        Data do Documento(vbak-audat);

    2 - Fazer Join entre as tables VBAK E VBAP:
        Fazendo o filtro pela tabela VBAK com os campos documento e data de documento.
    3 -  Apresentar os dois campos na tela.
    4 - Motrar mensagem de erro se não encontrar registro, e permanecer na tela inicial.
    5 -  Quando encontrar, mostrar uma mensagem de sucesso conforme abaixo. "Foram encontrado N registros".