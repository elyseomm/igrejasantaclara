<%@ Page Title="Área Restrita" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AreaRestrita.aspx.cs" Inherits="waSantaClara.AreaRestrita" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    
    <header class="container p-5 text-center">
        <h2 class="display-3"><%: Title %></h2>
    </header>
    
    <main class="container">
    
        <div class="alert alert-danger" role="alert" id="msgErro" runat="server"></div>

        <label>Login:</label>

        <div class="login-content">
            
            <div class="nowrap-col-content">                
                <div class="col-3 mb-3">
                    <label>Usuário:</label>
                    <asp:TextBox runat="server" id="txtUsuario" CssClass="form-control" placeholder="Digite o Nome do Usuário" OnTextChanged="txtUsuario_TextChanged" Width="290px"/>
                </div>

                <div class="col-6 mb-3">
                    <label>Senha:</label>
                    <asp:TextBox runat="server" id="txtSenha" CssClass="form-control" placeholder="Digite a Senha" OnTextChanged="txtSenha_TextChanged" Width="290px"/>
                </div>
            </div>
        </div>

        <br />
        <div class="col-6 mb-3" style="margin-top: 15px">                
            <asp:Button runat="server" id="btnLogin" CssClass="btn btn-success" Text="Salvar" OnClick="btnLogin_Click"/>
        </div>

    </main>
    
</asp:Content>
