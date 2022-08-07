*&---------------------------------------------------------------------*
*&  Include           ZEXERCICIOABAP01_TOP
*&---------------------------------------------------------------------*


"Tabela usada para filtro da tela de seleção.
TABLES: vbak.

"Classe
CLASS lcl_alv DEFINITION.
  PUBLIC SECTION.
    "metodos usados na classe
    METHODS:
      select_alv,
      montar_alv,
      validar_alv,
      retorna_dados,

      "Metodo Evento Linck_click
      handle_click
            FOR EVENT link_click OF cl_salv_events_table
               IMPORTING
                   row
                   column.


    "Declarações das variáveis usadas na classe
    DATA: cl_table     TYPE REF TO  cl_salv_table,
          gt_saida     TYPE         ztmo001,
          ls_saida     LIKE LINE OF gt_saida,
          lr_column    TYPE REF TO  cl_salv_column_table,
          lr_columns   TYPE REF TO  cl_salv_columns_table,
          lr_functions TYPE REF TO  cl_salv_functions,
          lr_events    TYPE REF TO  cl_salv_events_table.


ENDCLASS.