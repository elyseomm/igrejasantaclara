<%@ Page Title="Catequese" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Catequese.aspx.cs" Inherits="waSantaClara.Catequese" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %></h2>
    <h3>A Catequese agora adotou o sistema IVC(INICIAÇÃO À VIDA CRISTÃ).</h3>
    
    <h4>Pais, verifiquem se seus filhos já estão cadastrados. Caso negativo, efetuem o cadastro de seus filhos. Através dos links abaixo:</h4>
    <p>
        <a class="btn btn-warning" href="ListagemAlunos.aspx">Listagem Alunos no IVC &raquo;</a>
        <hr />
        <a class="btn btn-primary" href="CadastroResponsavel.aspx">Cadastrar IVC &raquo;</a>
        <hr />
    </p>
    
    <p>Entenda melhor o que é o sistema IVC:</p>
    <p>O IVC é uma catequese FAMILIAR desde 2021</p>
    <p>
        <a class="btn btn-info" href="https://catequistasbrasil.com.br/category/dinamicasparacatequese/ivc/">O que é o IVC &raquo;</a>
    </p>
</asp:Content>
