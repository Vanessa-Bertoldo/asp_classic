<!--#include file="topo.asp"-->  
<!--#include file="wpg_cnx.asp"-->  

<%
'RECEBENDO Cï¿½DIGO COMO PARAMETRO E EVT PARA SABER SE VAI INCLUIR OU ALTERAR
cod = Request.QueryString("cod")
evt  = Request.QueryString("evt")
if cod <> "" then
   cod = cint(cod)
end if
if ucase(evt) = "ALT" then
  'Faz a busca do dados na tabela para inserção dos valores nos campos
  sql = "SELECT * from tb_professor where cd_professor = "&cod
  'Response.Write(sql)
  'Response.End()
  set rs = conexao.execute(sql)

  nome                    =  rs("nome")
  email                   =  rs("email")
  cpf                     =  rs("cpf")
  data_nascimento         =  rs("data_nascimento")
  endereco                =  rs("endereco")
  cidade                  =  rs("cidade")
  curriculo               =  rs("curriculo")

  bot        = "Alterar"
else
   bot       = "Incluir"
end if

%>

<div class="container">
<br><br>
  <form class="form-horizontal" action="manu_professor.asp" method="post">

    <div class="form-group">
      <label class="control-label col-sm-2" for="nome"><b>Nome: </b></label>
      <div class="col-sm-4">
        <input type="text" class="form-control" id="nome" placeholder="Nome" name="nome" value="<%=nome%>">
      </div>
    </div>

     <div class="form-group">
      <label class="control-label col-sm-2" for="email"><b>Email: </b></label>
      <div class="col-sm-4">
        <input type="text" class="form-control" id="email" placeholder="Email" name="email" value="<%=email%>">
      </div>
    </div>

    <div class="form-group">
      <label class="control-label col-sm-2" for="cpf"><b>CPF: </b></label>
      <div class="col-sm-4">
        <input type="text" class="form-control" id="cpf" placeholder="CPF" name="cpf" value="<%=cpf%>">
      </div>
    </div>

    <div class="form-group">
      <label class="control-label col-sm-2" for="data_nascimento"><b>Data de nascimento: </b></label>
      <div class="col-sm-4">
        <input type="text" class="form-control" id="data_nascimento" placeholder="Data de nascimento" name="data_nascimento" value="<%=data_nascimento%>">
      </div>
    </div>

    <div class="form-group">
      <label class="control-label col-sm-2" for="endereco"><b>Endereço: </b></label>
      <div class="col-sm-4">
        <input type="text" class="form-control" id="endereco" placeholder="Endereço" name="endereco" value="<%=endereco%>">
      </div>
    </div>
    
    <div class="form-group">
      <label class="control-label col-sm-2" for="cidade"><b>Cidade: </b></label>
      <div class="col-sm-4">
        <input type="text" class="form-control" id="cidade" placeholder="Cidade" name="cidade" value="<%=cidade%>">
      </div>
    </div>

    <div class="form-group">
      <label class="control-label col-sm-2" for="curriculo"><b>Curriculo: </b></label>
      <div class="col-sm-4">
        <input type="text" class="form-control" id="curriculo" placeholder="Curriculo" name="curriculo" value="<%=curriculo%>">
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