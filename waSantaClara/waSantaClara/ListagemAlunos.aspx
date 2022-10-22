<%@ Page Title="Listagem de Alunos" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ListagemAlunos.aspx.cs" Inherits="waSantaClara.ListagemAlunos" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %></h2>
    <h3>Listagem de alunos atualmente cadastrados no IVC.</h3>
        
    <h4>Pesquisa:</h4>
    <p>
        <a class="btn btn-default" href="ListagemAlunos.aspx">Listagem alunos IVC &raquo;</a>
        <hr />
        <%--<a class="btn btn-default" href="CadastroAlunos.aspx">Cadastro IVC &raquo;</a>
        <hr />--%>
    </p>
</asp:Content>
