

<%
    session.lcid = 1046

    ' Conectar ao banco de dados SQL Server usando autenticação por usuario e senha

    Set Conexao = Server.CreateObject("ADODB.Connection")
    Conexao.Open "Provider=SQLOLEDB;Data Source=DESKTOP-T5ODAG3;Initial Catalog=sis_administrative;User ID=sa;Password=9813;"

    'Response.Write "<center><b>Conectado com sucesso ao banco de dados</center>"
%>
