<%@ Page Title="Igreja Santa Clara" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="waSantaClara._Default" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1>Igreja Santa Clara</h1>        
        <p class="lead">Seja bem vindo ao site da Igreja de Santa Clara</p>
        <span><a href="https://m.facebook.com/profile.php?id=100070845896710&_rdr"><image src="/Content/Imagens/facebook.jpg" width="35px"></a></span>
        <div style="margin-top:2vh">
            <image src="/Content/Imagens/imgSantaClara.jpg" width="50%"></image>
        </div>
        <div style="margin-top:2vh">
            <span>
                <asp:HyperLink ID="mapLink" runat="server"><image src="/Content/Imagens/googlemaps.png" width="35px"></asp:HyperLink>
                <%--<a href="https://www.google.com/maps/dir/-3.0758917,-59.9912634/Igreja+Católica+Santa+Clara+-+R.+31,+1-169+-+Cidade+Nova,+Manaus+-+AM,+69097-758/@-3.0443107,-60.0087601,13z/data=!3m1!4b1!4m9!4m8!1m1!4e1!1m5!1m1!1s0x926c190d281bc01b:0x5c9f2e65399f9d48!2m2!1d-59.9710091!2d-3.0132874"><image src="/Content/Imagens/googlemaps.png" width="35px"></a>--%>
            </span>
        </div>        
        <p style="margin-top:2vh">Endereço: R. 31, 1-169 - Cidade Nova, Manaus - AM, 69097-758</p>
    </div>
    

    <div class="row">
        <div class="col-md-4">
            <h2>Catequese 2022</h2>
            <p>
                Atenção Pais, fiquem atentos para o Cadastro Online de seus filhos para a catequese que já iniciou em setembro de 2022.
            </p>
            <p>
                <a class="btn btn-success" href="Catequese.aspx">Cadatro Online - Catequese&raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Batismos</h2>
            <p>
                Neste final de ano de 2022 teremos, ainda, cerimônia de Batismo na data 30/11/2022(Quarta-Feira).
            </p>
            <p>
                <a class="btn btn-info" href="Batismo.aspx">Batismos Agendados &raquo;</a>
            </p>
        </div>
        <div class="col-md-4">
            <h2>Matrimônios</h2>
            <p>
                Veja as datas de matrimônios agendadas em nossa paróquia em 2022.
            </p>
            <p>
                <a class="btn btn-danger" href="Matrimonio.aspx">Matrimônios Agendados &raquo;</a>
            </p>
        </div>
    </div>

</asp:Content>
