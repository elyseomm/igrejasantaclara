<%@ Page Title="Cadastro de Alunos" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CadastroAlunos.aspx.cs" Inherits="waSantaClara.CadastroAlunos" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    
    <header class="container p-5 text-center">
        <h2 class="display-3">Cadastro de alunos no IVC.</h2>
    </header>
    
    <main class="container">
        
        <div class="alert alert-danger" role="alert" id="msgErro" runat="server"></div>
        <div class="alert alert-success" role="alert" id="msgOk" runat="server">
                Registro salvo com sucesso!
        </div>

        <h4><strong>Responsável:</strong></h4>
        <div class="f-wrap-content">

            <div class="col-6 mb-3">                
                <asp:Label ID="txtNomeResp" runat="server" Font-Size="Large"></asp:Label>
            </div>            

            <div class="col-6 mb-3">
                <label>Grau de Parentesco do Responsável:</label>
                <asp:DropDownList runat="server" AppendDataBoundItems="true" ID="parentescoResp" CssClass="form-control">
                    <asp:ListItem Text="Mãe"    Value="0" Selected="True" />                   
                    <asp:ListItem Text="Pai"    Value="1" />
                    <asp:ListItem Text="Avós"   Value="2" />
                    <asp:ListItem Text="Tios"   Value="3" />
                    <asp:ListItem Text="Outros" Value="4" />
                </asp:DropDownList>
            </div>

        </div>
         <br />
        
        <h4><strong>Preencha os dados do aluno:</strong></h4>
        <div class="f-wrap-content">            

            <div class="col-6 mb-3">
                <label>Nome Aluno(Completo):</label>
                <asp:TextBox runat="server" id="txtNomeAluno" CssClass="form-control" placeholder="Digite o Nome do Aluno"/>
            </div>

            <div class="col-6 mb-3">
                <label>Nome do Pai:</label>
                <asp:TextBox runat="server" ID="txtPai" CssClass="form-control" placeholder="Digite Nome do Pai" />
            </div>

            <div class="col-6 mb-3">
                <label>Nome da Mãe:</label>
                <asp:TextBox runat="server" ID="txtMae" CssClass="form-control" placeholder="Digite Nome da Mãe" />
            </div>

            <div class="col-6 mb-3">
                <label>Data de Nascimento:</label>
                <asp:TextBox runat="server" id="txtDtNasc" CssClass="form-control" TextMode="Date" placeholder="Digite a Data de Nascimento"/>
            </div>

            <div class="col-6 mb-3">
                <label>Sexo:</label>
                <asp:DropDownList runat="server" AppendDataBoundItems="true" ID="sexo" CssClass="form-control">
                    <asp:ListItem Text="Feminino"   Value="0" Selected="True" />                   
                    <asp:ListItem Text="Masculino"  Value="1" />
                </asp:DropDownList>
            </div>

            <div class="col-6 mb-3">
                <label>Naturalidade:</label>
                <asp:TextBox runat="server" ID="txtNaturalidade" CssClass="form-control" placeholder="Digite a Naturalidade" />
            </div>

            <div class="col-6 mb-3">
                <label>Estado Civil:</label>                

                <asp:DropDownList runat="server" AppendDataBoundItems="true" ID="estadoCivil" CssClass="form-control">
                    <asp:ListItem Text="Solteiro(a)"      Value="0" Selected="True" />                   
                    <asp:ListItem Text="Casado(a)"        Value="1" />
                    <asp:ListItem Text="União Estável"    Value="2" />
                    <asp:ListItem Text="Divorciado(a)"    Value="3" />
                    <asp:ListItem Text="Disquitado(a)"    Value="4" />
                    <asp:ListItem Text="Viúvo(a)"         Value="5" />
                </asp:DropDownList>
            </div>

            <div class="col-6 mb-3">
                <label>Escolaridade:</label>

                <asp:DropDownList runat="server" AppendDataBoundItems="true" ID="escolaridade" CssClass="form-control">
                    <asp:ListItem Text="Analfabeto(a)"          Value="0" Selected="True" />                   
                    <asp:ListItem Text="Ensino Fundamental"     Value="1" />
                    <asp:ListItem Text="Ensino Médio"           Value="2" />
                    <asp:ListItem Text="Superior(Graduação)"    Value="3" />
                    <asp:ListItem Text="Pós-Graduado(a)"        Value="4" />
                    <asp:ListItem Text="Mestrado"               Value="5" />
                    <asp:ListItem Text="Doutorado"              Value="6" />
                </asp:DropDownList>
            </div>

            <div class="col-6 mb-3">
                <label>Endereço:</label>
                <asp:TextBox runat="server" ID="txtEndereco" CssClass="form-control" placeholder="Digite o Endereço" />
            </div>

            <div class="col-6 mb-3">
                <label>Número(Casa/Apt):</label>
                <asp:TextBox runat="server" ID="txtNrResid" CssClass="form-control" TextMode="Number" placeholder="Digite o Número da Residência" />
            </div>

            <div class="col-6 mb-3">
                <label>Bairro:</label>
                <asp:TextBox runat="server" ID="txtBairro" CssClass="form-control" placeholder="Digite o Nome do Bairro" />
            </div>

            <div class="col-6 mb-3">
                <label>Cidade:</label>
                <asp:TextBox runat="server" ID="txtCidade" CssClass="form-control" placeholder="Digite o Nome do Cidade" />
            </div>

            <div class="col-6 mb-3">

                <label>Participa de Grupo, Movimento ou Pastoral da Comunidade?</label>
                <asp:DropDownList runat="server" AppendDataBoundItems="true" ID="seEngajado" CssClass="form-control"
                    OnSelectedIndexChanged="SeEngajado_SelectedIndexChanged" AutoPostBack="True">
                    <asp:ListItem Text="Não" Value="0" Selected="True"/>                   
                    <asp:ListItem Text="Sim" Value="1" />
                </asp:DropDownList>
            </div>
            
            <div class="col-6 mb-3" id="grupoEngajamento" runat="server">                
                <asp:Label runat="server" ID="lblEnganjamento" Text="Grupo, Movmento ou Pastoral da Comunidade:" />
                <asp:TextBox runat="server" ID="txtEngajamento" CssClass="form-control" placeholder="Digite o Nome do Grupo, Movimento ou Pastoral" />
            </div>

            <div class="col-6 mb-3">
                <label>Marque nos sacramentos abaixo, aqueles aos quais você já recebeu:</label>
                <asp:CheckBoxList runat="server" id="chkSacramentos" >
                    <asp:ListItem Text=" Batismo"                        Value="1"/>
                    <asp:ListItem Text=" Primeira Eucaristia(Comunhão)"  Value="2"/>
                    <asp:ListItem Text=" Crisma"                         Value="3"/>
                    <asp:ListItem Text=" Matrimônio"                     Value="4"/>
                </asp:CheckBoxList>
            </div>

            <div class="col-6 mb-3">
                <label>Participa das Missas aos Domnigos?</label>

                <asp:DropDownList runat="server" AppendDataBoundItems="true" ID="seVaiAMissa" CssClass="form-control">
                    <asp:ListItem Text="Não" Value="0" />
                    <asp:ListItem Text="Às Vezes" Value="1"  Selected="True"/>
                    <asp:ListItem Text="Sim" Value="2" />
                </asp:DropDownList>
                
            </div>

            <div class="col-6 mb-3">
                <label>Participou ou frequentou outra Religião?</label>
                <asp:DropDownList runat="server" AppendDataBoundItems="true" ID="seOutraReligiao" CssClass="form-control"
                    OnSelectedIndexChanged="SeOutraReligiao_SelectedIndexChanged" AutoPostBack="True">
                    <asp:ListItem Text="Não" Value="0" Selected="True"/>                   
                    <asp:ListItem Text="Sim" Value="1" />
                </asp:DropDownList>
            </div>

            <div class="col-6 mb-3" id="grupoOutraReligiao" runat="server">
                <label>Religião(ões):</label>
                <asp:TextBox runat="server" ID="txtOutraReligiao" CssClass="form-control" placeholder="Digite o Nome das Religiões" />
            </div>

            <div class="col-6 mb-3">
                <label>Possui alguma aptidão artística?</label>

                <asp:DropDownList runat="server" AppendDataBoundItems="true" ID="seArtista" CssClass="form-control" 
                    OnSelectedIndexChanged="SeArtista_SelectedIndexChanged" AutoPostBack="True">
                    <asp:ListItem Text="Não" Value="0" Selected="True"/>                   
                    <asp:ListItem Text="Sim" Value="1" />
                </asp:DropDownList>
            </div>

            <div class="col-6 mb-3" id="grupoArte" runat="server">
                <label>Arte( Canta, Dança, Toca, etc.):</label>
                <asp:TextBox runat="server" ID="txtAptidaoArtistica" CssClass="form-control" placeholder="Digite o Nome das Aptidões Artísticas" />
            </div>
        </div>

        <br />

        <div class="f-wrap_container">

        </div>

        <br />
        <div class="col-6 mb-3" style="margin-top: 15px">                
            <asp:Button runat="server" id="btnSalvar" CssClass="btn btn-success" Text="Salvar" OnClick="btnSalvar_Click"/>
        </div>

    </main>

    <script>

        // Documento Ready() - JQuery
        $(function() {
            
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


