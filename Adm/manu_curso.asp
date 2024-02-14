<br>
<!--#include file="wpg_cnx.asp"-->
<%
    session.LCID        = 1046
    opc                 = request.querystring("opc")
    botao               =  request.form("botao")
    cod                 =  request.form("hfcod")

    nome                = request.form("nome")
    ativo               = request.form("ativo")
    resumo              = request.form("resumo")
    cd_professor        = request.form("professor")

    if botao = "Incluir" then

   sql = "insert into tb_curso (nome, ativo, resumo, cd_professor)"
   sql = sql & " values('"&nome&"','"&ativo&"','"&resumo&"','"&cd_professor&"')"
   'response.write sql
   'response.end
   conexao.execute(sql)
%>
<script>
    alert("Dados incluído com sucesso!")
    parent.location = "cst_curso.asp"
</script>
<%
elseif botao = "Alterar" then
  sql = "update tb_curso set"
  sql = sql & " nome = '"&nome&"',"
  sql = sql & " resumo = '"&resumo&"',"
  sql = sql & " cd_professor = '"&cd_professor&"',"
  sql = sql & " ativo = '"&ativo&"'"  
  sql = sql & " where cd_curso = "&cod
'response.write sql
'response.end
  conexao.execute(sql)
%>
<script>
    alert("Dados alterado com sucesso!")
    parent.location = "cst_modelo.asp"
</script>
<%
elseif opc <> "" then
   cod = request.querystring("cod")
   sql = "delete from tb_curso where cd_curso="&cod
   'response.write sql
   'response.end
   conexao.execute(sql)
%>
<script>
    alert("Linha excluída com sucesso!")
    parent.location = "cst_curso.asp"
</script>
<%
end if
%>