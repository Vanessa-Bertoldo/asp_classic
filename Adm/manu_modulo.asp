<br>
<!--#include file="wpg_cnx.asp"-->
<%
session.LCID = 1046
'RECEBENDO CAMPOS DO FORMULÁRIO
opc          = request.querystring("opc")
botao        =  request.form("botao")
cod          =  request.form("hfcod")

if botao = "Incluir" then
' INCLUINDO OS DADOS RECEBIDOS NA TABELA

'   sql = "insert into TABELA (nome,texto_modulo,anexo,[cd_curso])"
'   sql = sql & " values('"&variavel1&"','"&variavel2&"')"
'   response.write sql
'   response.end
'   conexao.execute(sql)
%>
<script>
    alert("Dados incluído com sucesso!")
    parent.location = "cst_modelo.asp"
</script>
<%
elseif botao = "Alterar" then
' ALTERANDO OS DADOS RECEBIDOS NA TABELA

'  sql = "update TABELA set"
'  sql = sql & " CAMPO1 = '"&variavel1&"',"
'  sql = sql & " CAMPO2 = '"&variavel2&"'"  
'  sql = sql & " where codigo = "&cod
'response.write sql
'response.end
'  conexao.execute(sql)
%>
<script>
    alert("Dados alterado com sucesso!")
    parent.location = "cst_modelo.asp"
</script>
<%
elseif opc <> "" then
' DELETANDO REGISTRO SELECIONADO
   cod = request.querystring("cod")
   sql = "delete from tb_modulo where cd_modulo="&cod
   'response.write sql
   'response.end
   conexao.execute(sql)
%>
<script>
    alert("Linha excluída com sucesso!")
    parent.location = "cst_modulo.asp"
</script>
<%
end if
%>