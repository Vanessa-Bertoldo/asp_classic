<br>
<!--#include file="wpg_cnx.asp"-->
<%
session.LCID = 1046 ' Locale ID � um identificador num�rico que representa as configura��es regionais e de idioma do sistema operacional. Especificar um LCID permite ajustar a formata��o de datas, n�meros, moedas e o idioma das mensagens de erro para corresponder �s prefer�ncias do usu�rio.

opc                     = request.querystring("opc")
botao                   =  request.form("botao")
cod                     =  request.form("hfcod")

nome                    = request.form("nome")
texto_modulo            = request.form("descricao")
anexo                   = request.form("anexo")
cd_curso                = request.form("curso")

if botao = "Incluir" then
   sql = "insert into tb_modulo (nome,texto_modulo,anexo,cd_curso)"
   sql = sql & " values('"&nome&"','"&texto_modulo&"','"&anexo&"','"&cd_curso&"')"
   'response.write sql
   'response.end
   conexao.execute(sql)
%>
<script>
    alert("Dados inclu�do com sucesso!")
    parent.location = "cst_modulo.asp"
</script>
<%
elseif botao = "Alterar" then

  sql = "update tb_modulo set"
  sql = sql & " nome = '"&nome&"',"
  sql = sql & " texto_modulo = '"&texto_modulo&"'," 
  sql = sql & " anexo = '"&anexo&"'," 
  sql = sql & " cd_curso = '"&cd_curso&"'"  
  sql = sql & " where cd_modulo = "&cod
  'response.write sql
  'response.end
  conexao.execute(sql)
%>
<script>
    alert("Dados alterado com sucesso!")
    parent.location = "cst_modulo.asp"
</script>
<%
elseif opc <> "" then
   cod = request.querystring("cod")
   sql = "delete from tb_modulo where cd_modulo="&cod
   'response.write sql
   'response.end
   conexao.execute(sql)
%>
<script>
    alert("Linha exclu�da com sucesso!")
    parent.location = "cst_modulo.asp"
</script>
<%
end if
%>