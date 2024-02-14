<!--#include file="topo.asp"-->  
<!--#include file="wpg_cnx.asp"-->  

<%
cod = Request.QueryString("cod")
evt  = Request.QueryString("evt")
if cod <> "" then
   cod = cint(cod)
end if
if ucase(evt) = "ALT" then
   'sql = "SELECT * from TABELA where CODIGO = "&cod
    sql = "SELECT c.cd_curso, c.ativo, c.nome, c.resumo, c.cd_professor, p.nome as professor FROM tb_curso as c LEFT JOIN tb_professor as p on p.cd_professor = c.cd_professor where cd_curso = "&cod
    'Response.Write(sql)
    'Response.End()
    set rs = conexao.execute(sql)
    nome                = rs("nome")
    ativo               = rs("ativo")
    resumo              = rs("resumo")
    cd_professor        = rs("cd_professor")
    nome_professor      = rs("professor")

   bot        = "Alterar"
else
   bot       = "Incluir"
end if

%>

<div class="container">
<br><br>
  <form class="form-horizontal" action="manu_curso.asp" method="post">

    <div class="form-group">
      <label class="control-label col-sm-2" for="nome"><b>Nome:</b></label>
      <div class="col-sm-4">
        <input type="text" class="form-control" id="nome" placeholder="Nome" name="nome" value="<%=nome%>">
      </div>
    </div>

    <div class="form-group">
         <label class="control-label col-sm-2" for="ativo"><b>Situação:</b></label>
        <div class="col-sm-4">
            <select name="ativo" class="form-control" value="<%=ativo%>">
                <option value="1">Ativo</option>
                <option value="0">inativo</option>
            </select>
        </div>

    <div class="form-group">
      <label class="control-label col-sm-2" for="resumo"><b>Resumo:</b></label>
      <div class="col-sm-4">
        <input type="text" class="form-control" id="resumo" placeholder="Resumo" name="resumo" value="<%=resumo%>">
      </div>
    </div>

    <div class="form-group">
         <label class="control-label col-sm-2" for="professor"><b>Professor:</b></label>
        <div class="col-sm-4">
            <select name="professor" class="form-control" value="<%=cd_professor%>">
                <option value="0">Selecione</option>
                <%
                    sql = "SELECT cd_professor, nome FROM tb_professor"
                    set rs = conexao.execute(sql)
                    do while not rs.eof
                %>
                <option class="form-control" value=<%=rs("cd_professor")%>><%=rs("nome")%></option>
                <%
                    rs.movenext
                    loop
                %>
            </select>
        </div>
    </div>
    <div class="form-group">        
      <div class="col-sm-offset-2 col-sm-10">
        <button type="submit" class="btn btn-default" name="Botao" value="<%=bot%>"><%=bot%></button>
      </div>
    </div>
	<input type="hidden" name="hfcod" value="<%=cod%>">	
  </form>
</div>

</body>
</html>