<br>
<!--#include file="wpg_cnx.asp"-->
<!--#include file="funcoes.asp"-->
<%
session.LCID = 1046
'RECEBENDO CAMPOS DO FORMULÁRIO
opc                     =  request.querystring("opc")
botao                   =  request.form("botao")
cod                     =  request.form("hfcod")

nome                    =  request.form("nome")
email                   =  request.form("email")
cpf                     =  request.form("cpf")
data_nascimento         =  request.form("data_nascimento")
endereco                =  request.form("endereco")
cidade                  =  request.form("cidade")
curriculo               =  request.form("curriculo")

if botao = "Incluir" then
' INCLUINDO OS DADOS RECEBIDOS NA TABELA
    sql = "INSERT INTO tb_professor (nome, cpf, data_nascimento, endereco, cidade, curriculo, email) " & _
          "VALUES ('" & nome & "','" & cpf & "','" & data_banco(data_nascimento) & "','" & endereco & "','" & cidade & "','" & curriculo & "','" & email & "')"
    'response.write sql
    'response.end
    conexao.execute(sql)
%>
<script>
    alert("Dados incluído com sucesso!")
    parent.location = "cst_professor.asp"
</script>
<%
elseif botao = "Alterar" then
' ALTERANDO OS DADOS RECEBIDOS NA TABELA

  sql = "update tb_professor set"
  sql = sql & " nome = '"&nome&"',"
  sql = sql & " email = '"&email&"',"
  sql = sql & " cpf = '"&cpf&"',"
  sql = sql & " data_nascimento = '"&data_banco(data_nascimento)&"',"
  sql = sql & " endereco = '"&endereco&"',"
  sql = sql & " cidade = '"&cidade&"',"
  sql = sql & " curriculo = '"&curriculo&"'"  
  sql = sql & " where cd_professor = '" & cod & "'"

  'response.write sql
  'response.write "<br>COD: "&cod
  'response.end
  conexao.execute(sql)
%>
<script>
    alert("Dados alterado com sucesso!")
    parent.location = "cst_professor.asp"
</script>
<%
elseif opc <> "" then
' DELETANDO REGISTRO SELECIONADO
    cod = request.querystring("cod")
    sql = "delete from tb_professor where cd_professor="&cod
    'response.write sql
    'response.end
    conexao.execute(sql)
%>
<script>
    alert("Linha excluída com sucesso!")
    parent.location = "cst_professor.asp"
</script>
<%
end if
%>