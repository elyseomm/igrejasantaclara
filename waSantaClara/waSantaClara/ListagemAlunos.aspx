<%@ Page Title="Listagem de Alunos" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ListagemAlunos.aspx.cs" Inherits="waSantaClara.ListagemAlunos" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    
    <header class="container p-5 text-center">
        <h2 class="display-3">Listagem de alunos atualmente cadastrados no IVC.</h2>
    </header>
    
    <main class="container">
    
        <div class="alert alert-danger" role="alert" id="msgErro" runat="server"></div>

        <h4>Pesquisa:</h4>

        <div class="f-wrap-content">        

            <div class="col-6 mb-3">
                <label>Aluno:</label>
                <asp:TextBox runat="server" id="txtNomeAluno" CssClass="form-control" placeholder="Digite o Nome do Aluno" OnTextChanged="txtNomeAluno_TextChanged"/>
            </div>

            <div class="col-6 mb-3">
                <label>Catequista:</label>
                <asp:TextBox runat="server" id="txtCatequista" CssClass="form-control" placeholder="Digite o Nome do Catequista" OnTextChanged="txtCatequista_TextChanged"/>
            </div>

            <div class="col-6 mb-3">
                <label>Responsável:</label>
                <asp:TextBox runat="server" id="txtResponsavel" CssClass="form-control" placeholder="Digite o Nome do Resposável" OnTextChanged="txtResponsavel_TextChanged"/>
            </div>            

        </div>

        <div style="margin: 1em">
            <asp:Button runat="server" id="btnPesquisar" CssClass="btn btn-success" Text="Pesquisar" OnClick="btnPesquisar_Click"/>
        </div>

        <div class="f-wrap-context">
            <div style="padding-top: 25px">

                <asp:GridView ID="alunos" runat="server" AutoGenerateColumns="False" allowpaging="True" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" ForeColor="Black" GridLines="None" Width="689px">
                    <AlternatingRowStyle BackColor="PaleGoldenrod" />
                    <Columns>                     
                        <asp:BoundField DataField="aluno" HeaderText="Aluno" ReadOnly="True" >
                        <HeaderStyle Font-Bold="True" HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:BoundField DataField="turma" HeaderText="Turma" SortExpression="turma" ReadOnly="True" >
                        <HeaderStyle Font-Bold="True" HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" Width="180px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="responsavel" HeaderText="Responsável" SortExpression="responsavel" ReadOnly="True" >
                        <HeaderStyle Font-Bold="True" HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" Width="180px" />
                        </asp:BoundField>                        
                        <asp:BoundField DataField="catequista" HeaderText="Catequista" SortExpression="catequista" ReadOnly="True">
                        <HeaderStyle Font-Bold="True" HorizontalAlign="Center" />
                        <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                        </asp:BoundField>
                        <asp:BoundField DataField="sala" HeaderText="Sala" ReadOnly="True" >               
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle Font-Bold="False" HorizontalAlign="Center" VerticalAlign="Middle" />
                        </asp:BoundField>
                    </Columns>
                    <FooterStyle BackColor="Tan" />
                    <HeaderStyle BackColor="Tan" Font-Bold="True" />
                    <PagerStyle ForeColor="DarkSlateBlue" HorizontalAlign="Center" BackColor="PaleGoldenrod" />
                    <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                    <SortedAscendingCellStyle BackColor="#FAFAE7" />
                    <SortedAscendingHeaderStyle BackColor="#DAC09E" />
                    <SortedDescendingCellStyle BackColor="#E1DB9C" />
                    <SortedDescendingHeaderStyle BackColor="#C2A47B" />
                </asp:GridView>

            </div>
        </div>
        
    </main>
</asp:Content>
