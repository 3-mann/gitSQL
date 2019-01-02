    set serveroutput on;

    var b_x varchar2(50);
    exec my_proc_01 (:b_x);
--################################################################################

execute read_file('PUMPE','myPumpe.txt');

--################################################################################

execute sal_status('PUMPE','myOutput.txt');

--################################################################################
DECLARE
input_string VARCHAR2 (200) := 'Secret Message';
output_string VARCHAR2 (200);
encrypted_raw RAW (2000); -- stores encrypted binary text
decrypted_raw RAW (2000); -- stores decrypted binary text
num_key_bytes NUMBER := 256/8; -- key length 256 bits (32 bytes)
key_bytes_raw RAW (32); -- stores 256-bit encryption key
encryption_type PLS_INTEGER := -- total encryption type
DBMS_CRYPTO.ENCRYPT_AES256
+ DBMS_CRYPTO.CHAIN_CBC
+ DBMS_CRYPTO.PAD_PKCS5;
BEGIN
DBMS_OUTPUT.PUT_LINE ( 'Original string: ' || input_string);
key_bytes_raw := DBMS_CRYPTO.RANDOMBYTES (num_key_bytes);
encrypted_raw := DBMS_CRYPTO.ENCRYPT
(
src => UTL_I18N.STRING_TO_RAW (input_string, 'AL32UTF8'),
typ => encryption_type,
key => key_bytes_raw
);
-- The encrypted value "encrypted_raw" can be used here
decrypted_raw := DBMS_CRYPTO.DECRYPT
(
src => encrypted_raw,
typ => encryption_type,
key => key_bytes_raw
);
output_string := UTL_I18N.RAW_TO_CHAR (decrypted_raw, 'AL32UTF8');
DBMS_OUTPUT.PUT_LINE ('Decrypted string: ' || output_string);
END;

--##########################################################################
DECLARE
    input_string VARCHAR2 (200) := 'SecreteMasse';
    output_string VARCHAR2 (200);
    encrypted_raw RAW (2000); -- stores encrypted binary text
    decrypted_raw RAW (2000); -- stores decrypted binary text
    num_key_bytes NUMBER := 256/8; -- key length 256 bits (32 bytes)
    key_bytes_raw RAW (32); -- stores 256-bit encryption key
    encryption_type PLS_INTEGER := -- total encryption type
    DBMS_CRYPTO.ENCRYPT_AES256
    + DBMS_CRYPTO.CHAIN_CBC
    + DBMS_CRYPTO.PAD_PKCS5;
BEGIN
    DBMS_OUTPUT.PUT_LINE ( 'Original string: ' || input_string);
    key_bytes_raw := DBMS_CRYPTO.RANDOMBYTES (num_key_bytes);
    encrypted_raw := DBMS_CRYPTO.ENCRYPT
    (
    src => UTL_I18N.STRING_TO_RAW (input_string, 'AL32UTF8'),
    typ => encryption_type,
    key => key_bytes_raw
    );
    DBMS_OUTPUT.PUT_LINE ( 'kryption: '|| encrypted_raw);
    -- The encrypted value "encrypted_raw" can be used here
    decrypted_raw := DBMS_CRYPTO.DECRYPT
    (
    src => encrypted_raw,
    typ => encryption_type,
    key => key_bytes_raw
    );
    output_string := UTL_I18N.RAW_TO_CHAR (decrypted_raw, 'AL32UTF8');
    DBMS_OUTPUT.PUT_LINE ('Decrypted string: ' || output_string);
END;

--##########################################################################

set serveroutput on;
begin
    For x in ( select deptno, dname, loc from dept
    where deptno = 10 )
    loop
    dbms_output.put_line( 'Dname: ' || x.dname );
    dbms_output.put_line( 'Loc: ' || x.loc );
    dbms_output.put_line( 'Hash: ' ||
    dbms_crypto.hash
    ( utl_raw.cast_to_raw(x.deptno||'/'||x.dname||'/'||x.loc),
    dbms_crypto.hash_sh1 ) );
    end loop;
end;

--##########################################################################

begin
    for x in ( select deptno, dname, loc
    from dept
    where deptno = 10
    for update nowait )
    loop
        if ( hextoraw( 'C44F7052661CE945D385D5C3F911E70FA99407A6' ) <>
            dbms_crypto.hash
            ( utl_raw.cast_to_raw(x.deptno||'/'||x.dname||'/'||x.loc),
            dbms_crypto.hash_sh1 ) )
            then
            raise_application_error(-20001, 'Row was modified' );
        end if;
    end loop;
    update dept
    set dname = 'NEW YORK'
    --set dname = lower(dname)
    where deptno = 10;
    commit;
end;
--##########################################################################
CREATE TABLE employees AS SELECT * FROM emp ;
/
ALTER TABLE employees ADD cryptosp RAW(200) ;
Alter Table employees ADD cryptonew RAW(200);
/
--##########################################################################
DECLARE 
cursor c1 IS
select empno, sal, hiredate FROM employees FOR UPDATE NOWAIT ;
BEGIN
FOR x in c1  LOOP 
  --UPDATE employees SET cryptosp=
 UPDATE employees SET cryptonew=
 dbms_crypto.hash
 ( utl_raw.cast_to_raw(x.empno||'/'||x.sal||'/'||x.hiredate),
 dbms_crypto.hash_sh1 ) 
 WHERE CURRENT OF c1;
 end loop;
 end; 
 
 Select * from employees;
 update employees set sal = 1500 where ename ='MILLER';
 Select ename,COALESCE(0.9*list_price, min_price, 5),nullif(cryptosp,cryptonew) from employees;
--##########################################################################
DECLARE 
    cursor c1 IS
    select empno, ename, sal, hiredate,crypto_aktuell, cryptosp 
    FROM employees 
    WHERE cryptosp IS NOT NULL 
    FOR UPDATE NOWAIT ;
BEGIN
    FOR x in c1  LOOP 
        UPDATE employees SET crypto_new = dbms_crypto.hash
        ( utl_raw.cast_to_raw(x.empno||'/'||x.sal||'/'||x.hiredate), dbms_crypto.hash_sh1 ) 
        WHERE CURRENT OF c1;
        --SELECT ename, NULLIF(crypto_aktuell,cryptosp) INTO v_ename, v_anders FROM employees ;
        IF x.crypto_aktuell<>x.cryptosp THEN 
        DBMS_OUTPUT.PUT_LINE(x.ename ||' Achtung geaenderte Daten') ;
        END IF ;
    end loop;
end;
/ 

--##########################################################################