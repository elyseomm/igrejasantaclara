<%@ Page Title="Contato" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contato.aspx.cs" Inherits="waSantaClara.Contato" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %></h2>
    <h3>Secretaria da arquidiocese de Santa Clara</h3>
    <p style="margin-top: 35px"></p>
    <address>       
        <strong>Endereço:</strong>   <asp:Label ID="endereco" runat="server"></asp:Label><br />
        <p style="margin-top: 15px"></p>
        <strong>Telefone:</strong>   <asp:Label ID="telefone" runat="server"></asp:Label><br />
        <p style="margin-top: 15px"></p>
        <strong>Contato:</strong>   <asp:Label ID="secretario" runat="server"></asp:Label><br />
        <p style="margin-top: 15px"></p>
        <strong>Email Secretaria:</strong>   <asp:Label ID="email" runat="server"></asp:Label>
        <p style="margin-top: 15px"></p>
        <strong>Facebook:</strong>
        <span><a ID="facebook" runat="server"><image src="/Content/Imagens/facebook.jpg" width="35px"></a></span>
        <p style="margin-top: 15px"></p>
        <strong>Google Maps:</strong>
        <span><a ID="maps" runat="server" ><image src="/Content/Imagens/googlemaps.png" width="35px"></a></span>

    </address>
</asp:Content>
