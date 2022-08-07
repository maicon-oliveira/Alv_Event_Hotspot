*&---------------------------------------------------------------------*
*&  Include           ZEXERCICIOABAP01_SSC
*&---------------------------------------------------------------------*

    "Tela de selção do alv
    SELECTION-SCREEN BEGIN OF BLOCK lb01 WITH FRAME TITLE text-001.
    SELECT-OPTIONS: s_vbeln FOR vbak-vbeln,
                    s_audat FOR vbak-audat OBLIGATORY.
    SELECTION-SCREEN END OF BLOCK lb01.