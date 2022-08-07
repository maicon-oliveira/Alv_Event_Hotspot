*&---------------------------------------------------------------------*
*& Report  ZEXERCICIOABAP01
*&
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
*&   1- Tela de seleção deve ter;                                      *
*&                                                                     *
*&  Documento                                                          *
*&  Data de Documento                                                  *
*&   2 - Fazer Join entre as tabelas VBAK E VBAP,                      *
*&       fazendo o filtro pela tabela VBAK com os                      *
*&       campos documento e data de documento.                         *
*&                                                                     *
*&   3 - Apresentar os dois campos na tela.                            *
*&                                                                     *
*&  Validações                                                         *
*&   1 - Motrar mensagem de erro se não encontrar registro,            *
*&       e permanecer na tela inicial                                  *
*&   2 - Quando encontrar registro, mostrar uma mensagem               *
*&       de sucesso conforme abaixo.                                   *
*&       "Foram encontrados N registros"                               *
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