<!--#include file="topo.asp"-->  
<!--#include file="wpg_cnx.asp"-->  

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <!-- Incluindo os arquivos CSS do Bootstrap -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
  <%
      sql = "select * from tb_professor order by nome "
      set rs = conexao.execute(sql)
  %>
    <script>
  function Excluir(cod)
    {
      console.log("COD ", cod)
    if(confirm("Confirma exclusao?"))
      {
        parent.location = "manu_professor.asp?opc=exc&cod=" + cod ;
        }
    
    } 
    
  </script>

  <div class="container">
  <form action="frm_professor.asp" method=post>
    <h4>Professor</h4>
    <div class="table-responsive">          
    <table class="table">
      <thead>
        <tr>
          <th>#</th>
          <th>Nome</th>
          <th>CPF</th>	
          <th>Email</th>
          <th>Excluir</th>
          <th>Editar</th>	
        </tr>
      </thead>
      <tbody>
  <%
  'AQUI COME�A O DO WHILE ONDE TRAR� AS LINHAS DE ACORDO COM O SELECT FEITO
  i = 1
  do while not rs.eof%>
        <tr>
          <td><%=i%></td>
          <td><%=rs("nome")%></td>
          <td><%=rs("CPF")%></td>
          <td><%=rs("Email")%></td>
          <td>
              <a href="javascript:Excluir(<%=rs("cd_professor")%>)">
                  <img src="imagens/excluir.jpg">
              </a>		
      </td>
          <td>
              <a href="frm_professor.asp?evt=alt&cod=<%=rs("cd_professor")%>">
                  <img src="imagens/alt.jpg">
              </a>		
          </td>
        </tr>
  <%
  'LOOP DEPOIS DA LINHA PARA QUE SE REPITA ENQUANTO TIVER REGISTROS NO SELECT FEITO
  i = i +1 
  rs.movenext
  loop
  %>	 
      </tbody>
    </table>
  <button type="submit" class="btn btn-primary">Adicionar</button>
    </div>
  </form>

  </div>
</body>
</html>