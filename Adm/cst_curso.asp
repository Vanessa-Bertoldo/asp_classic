<!--#include file="topo.asp"-->  
<!--#include file="wpg_cnx.asp"-->  
<%
    sql = "SELECT c.cd_curso, c.ativo, c.nome, c.resumo, p.nome as professor FROM tb_curso as c LEFT JOIN tb_professor as p on p.cd_professor = c.cd_professor"
    set rs = conexao.execute(sql)

%>
<script>
    function Excluir(cod)
    {
	 if(confirm("Confirma exclus�o?"))
	  {
	    parent.location = "manu_curso.asp?opc=exc&cod=" + cod ;
      }
   
    } 
 </script>

<div class="container">
<form action="frm_curso.asp" method=post>
  <h4>Curso</h4>
  <div class="table-responsive">          
  <table class="table">
    <thead>
      <tr>
        <th>#</th>
        <th>Nome</th>
        <th>Resumo</th>
        <th>Ativo</th>
        <th>Professor</th>	
        <th>Excluir</th>
        <th>Editar</th>		
      </tr>
    </thead>
    <tbody>
<%
    i = 1
    do while not rs.eof%>
      <tr>
        <td><%=i%></td>
        <td><%=rs("nome")%></td>
        <td><%=rs("resumo")%></td>
        <td><%=rs("ativo")%></td>
        <td><%=rs("professor")%></td>
        <td>
            <a href="javascript:Excluir(<%=rs("cd_curso")%>)">
            <img src="imagens/excluir.jpg">
            </a>		
		</td>
        <td>
            <a href="frm_curso.asp?evt=alt&cod=<%=rs("cd_curso")%>">
            <img src="imagens/alt.jpg">
            </a>		
		</td>
      </tr>
<%
    i = i + 1
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