FUNCTION z_mo_ordem__venda.
*"----------------------------------------------------------------------
*"*"Interface local:
*"  IMPORTING
*"     REFERENCE(I_VBELN) TYPE  ZTRANGEVBELN
*"     REFERENCE(I_AUDAT) TYPE  ZTRANGEAUDAT
*"  EXPORTING
*"     REFERENCE(T_VBAK) TYPE  ZTMO001
*"----------------------------------------------------------------------
  TYPES: BEGIN OF t_kna1,
           kunnr TYPE kna1-kunnr,
           name1 TYPE kna1-name1,
         END OF t_kna1.


  DATA: wa_kna1  TYPE TABLE OF t_kna1,
        wa_vbak  TYPE ZTMO001,
        lv_dados TYPE t_kna1.

  SELECT a~vbeln a~audat a~kunnr
    FROM vbak AS a
    INNER JOIN vbap AS b
    ON a~vbeln = b~vbeln
    INTO TABLE wa_vbak
    WHERE a~vbeln IN i_vbeln[]
    AND   a~audat IN i_audat[].

  IF sy-subrc = 0.

    SELECT kunnr name1
      FROM kna1
      INTO TABLE wa_kna1
      FOR ALL ENTRIES IN wa_vbak
      WHERE kunnr = wa_vbak-kunnr.

    LOOP AT wa_vbak ASSIGNING FIELD-SYMBOL(<fs_dados>).
      READ TABLE wa_kna1 INTO lv_dados WITH KEY kunnr = <fs_dados>-kunnr.
      <fs_dados>-name1 = lv_dados-name1.

      APPEND <fs_dados> TO t_vbak.
    ENDLOOP.

  ENDIF.

ENDFUNCTION.