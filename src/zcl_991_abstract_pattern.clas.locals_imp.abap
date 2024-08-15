*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations
CLASS lclSaleDocument DEFINITION ABSTRACT.

  PUBLIC SECTION.
    METHODS write ABSTRACT RETURNING VALUE(text) TYPE string.
  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.

CLASS lclQuotation DEFINITION INHERITING FROM lclSaleDocument.

  PUBLIC SECTION.
    METHODS: write REDEFINITION.
  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.

CLASS lclQuotation IMPLEMENTATION.

  METHOD write.
    text = `Quotation`.
  ENDMETHOD.

ENDCLASS.

CLASS lclOrder DEFINITION INHERITING FROM lclSaleDocument.

  PUBLIC SECTION.
    METHODS: write REDEFINITION.
  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.

CLASS lclOrder IMPLEMENTATION.

  METHOD write.
    text = `Order`.
  ENDMETHOD.

ENDCLASS.

INTERFACE lifSaleDocumentFactory.
  METHODS:
    create IMPORTING imDocType    TYPE lclVbType
           RETURNING VALUE(reDoc) TYPE REF TO lclSaleDocument.
ENDINTERFACE.


CLASS lclSaleDocumentFactory DEFINITION.

  PUBLIC SECTION.
    INTERFACES lifSaleDocumentFactory.
  PROTECTED SECTION.
  PRIVATE SECTION.
    ALIASES create FOR lifSaleDocumentFactory~create.

ENDCLASS.

CLASS lclSaleDocumentFactory IMPLEMENTATION.

  METHOD create.
    DATA loDoc TYPE REF TO lclSaleDocument.
    CASE imDocType.
      WHEN 'B'.
        CREATE OBJECT loDoc TYPE lclQuotation.
      WHEN 'C'.
        CREATE OBJECT loDoc TYPE lclOrder.
      WHEN OTHERS.
*            default, create order
        CREATE OBJECT loDoc TYPE lclOrder.
    ENDCASE.
    reDoc = loDoc.
  ENDMETHOD.

ENDCLASS.
