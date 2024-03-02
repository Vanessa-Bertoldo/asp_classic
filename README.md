<p align="center">
  <a href="https://hibernate.org/" target="blank"><img src="/Adm/imagens/asp.png" width="320" alt="Asp Logo" /></a>
</p>

<h1 align="center"> Project created with classic ASP </h1>

<h2> Environment Setting ⚒️</h2>
<p>You will need to have the ISS configured on your Windows</p>
<p>First clone this repository</p>
<a  href="https://youtu.be/FfSj9VT5nms?si=Aav3KPNsBOd0OiXp"><p>After that lick here to start configuration</p></a>

<h2> Database configuration</h2>
<p>The file to generate the databases tables is in the "script" folder</p>
  
# Data persistence with JPA: Hibernate
<p>This API is based on a system for internal use of a store</p>
<p>Edite the "wpg_cnx.asp" file according to your database</p>

```bash
   <%
      session.lcid = 1046
  
      Set Conexao = Server.CreateObject("ADODB.Connection")
      Conexao.Open "Provider=SQLOLEDB;Data Source=your_name-desktop;Initial Catalog=your_database;User ID=sa;Password=your_password;"
  
      'Response.Write "<center><b>Conectado com sucesso ao banco de dados</center>"
  %>
```  
