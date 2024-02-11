<%
    response.charset = "utf-8"
%>

<%
    txt1 = "texto 1"
    txt2 = "testo 2"
    response.write txt1 &" "& txt2
%>

<br/>
<mark>Olá,</mark>
<h3>======================================= Else If</h3>
<!-- if else -->
<%
    hora = hour(now)
    if hora <= 12 then
        response.write "Bom dia"
    elseif hora > 12 and hora <= 18 then 
        response.write "Boa tarde"
    else 
        response.write "Boa noite"
    end if
    response.write "Agora são " & hora
%>
<p>ASP clássico é legal ne</p>
<h3>======================================= While</h3>
<!-- while -->
<table>
    <tr>
        <%
            i=1
            do while i< 20
                response.write "teste "& i
                i = i + 1
                Loop
        %>
    </tr>
</table>
<h3>======================================= Form Next</h3>
<!-- for next -->
<table>
    <tr>
        <%
            For i=0 to 30
                response.write "teste "& i
                Next
        %>
    </tr>
</table>
<h3>======================================= Objeto request servervariables</h3>
<!-- Objeto request servervariables -->
<%
    =Request.ServerVariables("PATH_INFO")
%>
<br>
<h3>======================================= Objetos request</h3>
<h3>=== QueryString === </h3>
<!-- Objeto request QueryString: recebe parametros através de links ou formulários do metodo get -->
<a href="index.asp?estudo=Desenvolvimento web&modulo=ASP">Link teste</a><br>
<%
    estudo = request.querystring("estudo")
    modulo = request.querystring("modulo")
    if estudo <> "" then 
        response.write "<br>Estudando: "&estudo
    end if
    if modulo <> "" then 
        response.write "<br>Modulo: "&modulo
    end if
%>
<br>
<h3>=== Form === </h3>
<!-- Objeto request Form: recebe parametros de formularios -->
<!-- O method post permite que os parametros fiquem "escondidos" dentro do HTML e não ficam expostos no link, como no exemplo acima -->
<form method="post" action="index.asp">
    Nome: <input type="text" name="nome"><br>
    Email: <input type="text" name="email"><br>
    <input type="submit" value="Enviar">
</form>    
<%
    'Usamos querystring quando pegamos via get e form ao pegar via post
    response.write(request.form("nome"))&"<br>"
    response.write(request.form("email"))&"<br>"
%>
<br>
<h3>=== Formularios List Box e Radio Button ===</h3>
<!-- Formularios List Box e Radio Button -->
<form method="post" action="index.asp">
    <select name="cliente">
        <option value="1">Maria</option>
        <option value="2">João</option>
        <option value="3">Darth Vader</option>
    </select>

    Masculino
    <input type="radio" name="sexo" value="masculino">
    feminino
    <input type="radio" name="sexo" value="feminino">
    <input type="submit" value="Enviar list">
</form>  
<%
    response.write(request.form("cliente"))&"<br>"
    response.write(request.form("sexo"))&"<br>"
%><br><br>
<h3>======================================= trabalhando com numeros e operações</h3>
<form method="post" action="index.asp">
    Valor 1: <input type="text" name="valor1">
    Valor 2: <input type="text" name="valor2">
    <input type="submit" value="Calcular">
</form>
<%
    valor1 = cint(request.form("valor1"))
    valor2 = cint(request.form("valor2"))
    if valor1 <> "" and valor2 <> "" then 
%>
    <b>Adição</b><%=valor1+valor2%><br>
    <b>Subtração</b><%=valor1-valor2%><br>
    <b>Multiplicação</b><%=valor1*valor2%><br>
    <b>Divisão</b><%'=valor1/valor2 %><br>
<% end if%><br><br>
<h3>======================================= trabalhando com datas e funções</h3>
<form method="post" action="index.asp">
    Data: <input type="text" name="data">
    Número: <input type="text" name="num">
    <input type="submit" value="Calcular">
</form>
<%
    'Cdate converte variável para tipo de data
    data = request.form("data")
    num = request.form("num")
    if data <> "" and num <> "" then 
        data = cdate(data)
   
%>  
    Data: <%=data%> - <%=data_diasemana(data)%><br>
    Adição: <%=data+num%><br>
    Dia da semana: <%=data_diasemana(data+num)%>
<%
    end if
    function data_diasemana(data_s)
        dia_s = weekday(cdate(data_s))
        select Case dia_s
            Case 1
                dia_s = "Domingo"
            Case 2
                dia_s = "Segunda-feira"
            Case 3
                dia_s = "Terça-feira"
            Case 4
                dia_s = "Quarta-feira"
            Case 5
                dia_s = "Quinta-feira"
            Case 6
                dia_s = "Sexta-feira"
            Case 7
                dia_s = "Sábado"
        End select
        data_diasemana = dia_s
    end function
%>