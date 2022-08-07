*&---------------------------------------------------------------------*
*& Report  ZEXERCICIOABAP01
*&
*&---------------------------------------------------------------------*

REPORT zexercicioabap01.

INCLUDE zexercicioabap01_top.
INCLUDE zexercicioabap01_ssc.
INCLUDE zexercicioabap01_f02.


START-OF-SELECTION.

  "Cria um objeto da classe lcl_alv
  DATA(exibe_alv) = NEW lcl_alv( ).
  "Objeto chama o metodo que retorna todo o processamento
  exibe_alv->retorna_dados( ).