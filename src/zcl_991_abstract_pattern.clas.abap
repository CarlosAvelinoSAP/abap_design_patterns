CLASS zcl_991_abstract_pattern DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
    ALIASES run FOR if_oo_adt_classrun~main.
ENDCLASS.



CLASS ZCL_991_ABSTRACT_PATTERN IMPLEMENTATION.


  METHOD run.

    DATA goDoc TYPE REF TO lclSaleDocument.
    DATA goSaleDocumentFactory TYPE REF TO lifSaleDocumentFactory.
    DATA paDoctype TYPE lclVbType VALUE 'B'.

    CREATE OBJECT goSaleDocumentFactory TYPE lclSaleDocumentFactory.

    goDoc = goSaleDocumentFactory->create( paDocType ).
    out->write( goDoc->write(  ) ).

  ENDMETHOD.
ENDCLASS.
