<!--#include file="topo.asp"-->  
<!--#include file="wpg_cnx.asp"-->  
<%

sql = "select tm.cd_modulo, tm.texto_modulo, tm.nome,  tm.anexo, tc.nome as curso from tb_modulo as tm left join tb_curso as tc on tm.cd_curso = tc.cd_curso order by tm.nome "
set rs = conexao.execute(sql)

%>
  <script>
function Excluir(cod)
   {
	 if(confirm("Confirma exclusï¿½o?"))
	  {
	    parent.location = "manu_modulo.asp?opc=exc&cod=" + cod ;
      }
   
   } 
 	
 </script>

<div class="container">
<form action="frm_modulo.asp" method=post>
  <h4>Modulos</h4>
  <div class="table-responsive">          
  <table class="table">
    <thead>
      <tr>
        <th>#</th>
        <th>Nome</th>
        <th>Descrição</th>
        <th>Curso</th>	
        <th>Excluir</th>
        <th>Editar</th>	
      </tr>
    </thead>
    <tbody>
<%
'AQUI COMEï¿½A O DO WHILE ONDE TRARï¿½ AS LINHAS DE ACORDO COM O SELECT FEITO
i = 1
do while not rs.eof%>
      <tr>
       
        <td> <%=i%></td>
        <td><%=rs("nome")%></td>
        <td> <%=rs("texto_modulo")%></td>
        <td><%=rs("curso")%></td>
        <td>
          <a href="javascript:Excluir(<%=rs("cd_modulo")%>)"><img src="imagens/excluir.jpg"></a>		
        </td>
        <td>
          <a href="frm_modelo.asp?evt=alt&cod=<%=rs("cd_modulo")%>"> <img src="imagens/alt.jpg"></a>		
		    </td>
      </tr>
<%
  i = i + 1
  rs.movenext
  loop
%>	  
    </tbody>
  </table>

  </div>
  <button type="submit" class="btn btn-primary">Adicionar</button>
</form>

</div>
</body>
</html>