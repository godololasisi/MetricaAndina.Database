CREATE OR REPLACE PACKAGE BODY PKG_MetricaAndina_Client
IS  
procedure GetClientByParameter;
AS
    vRuc    IN Client.Ruc%TYPE,
    vCodigo         OUT NUMBER,
    vMensaje            OUT VARCHAR2,
    vRazonSocial OUT VARCHAR2
)
AS
vCount NUMBER;
BEGIN
    vCodigo  := 1;
    vMensaje := 'OK';
    vRazonSocial := '';

    SELECT 
    COUNT(1) INTO vCount
    FROM CLIENT CL;

    IF vCount >= 1 THEN -- EXISTE EL USUARIO
        Select 
        cl.RazonSocial
        INTO vRazonSocial
        From Client cl
        INNER JOIN Campus ca on cl.codigocampus = ca.codigo
        Where cl.Ruc = vRuc;
        RETURN;
    ELSE    -- NO EXISTE USUARIO
        vCodigo := 0;
        vMensaje := 'No existe cliente.';
        RETURN;
    END IF; 
END;

END  PKG_GetClientByParameter;





