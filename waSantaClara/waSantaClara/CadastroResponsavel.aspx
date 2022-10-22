<%@ Page Title="Cadastro de Responsável" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CadastroResponsavel.aspx.cs" Inherits="waSantaClara.CadastroResponsavel" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    
    <header class="container p-5 text-center">
        <h2 class="display-3">Cadastro de alunos no IVC.</h2>
    </header>
    
    <main class="container">
       
        <div class="alert alert-danger" role="alert" id="msgErro" runat="server"></div>

        <div class="row">
            <h4><strong>Preencha os dados do Responsável:</strong></h4>

            <div class="col-6 mb-3">
                <label>Nome Responsável:</label>
                <asp:TextBox runat="server" id="txtNomeResp" CssClass="form-control" placeholder="Digite o Nome do Responsável" 
                    OnTextChanged="txtNomeResp_TextChanged"/>
            </div>

            <div class="col-6 mb-3">
                <label>Celular Responsável:</label>
                <asp:TextBox runat="server" id="txtCelularResp" CssClass="form-control" TextMode="Phone" placeholder="Digite o Nr Celular do Responsável"
                    OnTextChanged="txtCelularResp_TextChanged"/>
            </div>

            <div class="col-6 mb-3">
                <label>Email Responsável:</label>
                <asp:TextBox runat="server" id="txtEmailResp" CssClass="form-control" TextMode="Email" placeholder="Digite o Email do Responsável" 
                    OnTextChanged="txtEmailResp_TextChanged"/>
            </div>
            
        </div>

        <br />
        <div class="col-6 mb-3" style="margin-top: 15px">                
            <asp:Button runat="server" id="btnSalvar" CssClass="btn btn-success" Text="Salvar" OnClick="btnSalvar_Click"/>
            <div class="alert alert-success" role="alert" id="msgOk" runat="server">
                Registro salvo com sucesso!
            </div>
        </div>
        <div class="col-6 mb-3" style="margin-top: 15px">                
            <asp:Button runat="server" id="btnProximo" CssClass="btn btn-primary" Text="Continuar &raquo;" OnClick="btnProximo_Click"/>
        </div>

    </main>

    <script>

        // Documento Ready() - JQuery
        $(function() {


            $("#MainContent_txtCelularResp").mask('(99)99999-9999', { reverse: true });

            $('#MainContent_seEngajado').on('change', function () {
                                
                //if (this.value == 0) {
                //    $("#divTxtEngajamento").css("visibility", "hidden")
                //    console.log('Hide!')
                //}
                //else {
                //    $("#divTxtEngajamento").css("visibility", "visible")
                //    console.log('Show!')
                //    $('#MainContent_txtEngajamento').focus()
                //}
            })

        })

    </script>

</asp:Content>


