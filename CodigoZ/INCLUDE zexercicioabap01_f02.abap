*&---------------------------------------------------------------------*
*&  Include           ZEXERCICIOABAP01_F02
*&---------------------------------------------------------------------*


CLASS lcl_alv IMPLEMENTATION.
    "Metodo que faz o select na tabela
      METHOD select_alv.
    
        "Variaveis de tipo range para receber o range do select-options da tela de seleção
        DATA: r_vbeln TYPE ztrangevbeln,
              r_audat TYPE ztrangeaudat.
    
        "Variaveis recebem os valores inseridos na tela de seleção do alv
        r_vbeln[] = s_vbeln[].
        r_audat[] = s_audat[].
    
        "Função criada para realizar o select na tabela, passando os parametros recebidos da tela e retornando
        "os valores dentro da tabela interna do alv
        CALL FUNCTION 'Z_MO_ORDEM__VENDA'
          EXPORTING
            i_vbeln = r_vbeln
            i_audat = r_audat
          IMPORTING
            t_vbak  = gt_saida.
    
    
    
      ENDMETHOD.
    
      "Metodo que processa o evento
      METHOD handle_click.
        "Guarda a linha selecionada no alv (row)
        "Guarda os dados selecionados da linha(ls_saida)
        READ TABLE gt_saida INTO ls_saida INDEX row.
        "Verifica se esta tudo ok
        CHECK sy-subrc = 0.
    
        "Evento só funciona na coluna 'VBELN'
        CASE column.
          "Clicando na linha(coluna 'VBELN')
          WHEN 'VBELN'.
            "O programa pega as informações da linha e usando o ID(Cada Transação tem um ID)
            SET PARAMETER ID 'AUN' FIELD ls_saida-vbeln.
            "Ele joga as informações para a transação 'VA03'
            CALL TRANSACTION 'VA03' AND SKIP FIRST SCREEN.
        ENDCASE.
    
      ENDMETHOD.
    
    
      METHOD montar_alv.
    
        "Metodo que recebe os dados da tabela interna para montar o alv
        TRY.
            CALL METHOD cl_salv_table=>factory
              IMPORTING
                r_salv_table = cl_table
              CHANGING
                t_table      = gt_saida.
          CATCH cx_salv_msg .
        ENDTRY.
    
    
        lr_columns = cl_table->get_columns( ).
    
        TRY.
*    seleciona coluna para o metodo hotspot(link_click)
            lr_column ?= lr_columns->get_column( 'VBELN' ).
            lr_column->set_cell_type( if_salv_c_cell_type=>hotspot ).
    
*    Apaga coluna do ALV.
            lr_column ?= lr_columns->get_column( 'KUNNR' ).
            lr_column->set_visible( value  = if_salv_c_bool_sap=>false ).
          CATCH cx_salv_not_found.
        ENDTRY.
    
*   chama o metodo handle_click através do lr_events.
        lr_events = cl_table->get_event( ).
        SET HANDLER me->handle_click FOR lr_events.
    
      ENDMETHOD.
    
      METHOD validar_alv.
    
    
        "Conta o numero de linhas(sy-tfill) na tabela interna (gt_saida).
        DESCRIBE TABLE gt_saida LINES sy-tfill.
    
    
        "se o numero de linhas for diferente de zero
        IF sy-tfill IS NOT INITIAL.
          "s001 = sucesso exibe mensagem 001 da classe zmo01
          MESSAGE  s001(zmo01) WITH sy-tfill.
          "Monta Relatorio.
          cl_table->display( ).
        ELSE.
* DYSPLAY LIKE faz o tratamento para que a mesagem de sucesso venha
* a ser executada com o status de Erro ('E').
* Mensagem e002 processa e a executa em uma nova janela, com este tratamento
* a mensagem permanece na mesma tela de seleção.
          MESSAGE  s002(zmo01) DISPLAY LIKE 'E'.
        ENDIF.
    
      ENDMETHOD.
      "Metodo usado somente para retornar os dados
      METHOD retorna_dados.
        select_alv( ).
        montar_alv( ).
        validar_alv( ).
      ENDMETHOD.
    
    ENDCLASS.