<%@ Page Title="Batismos" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Batismo.aspx.cs" Inherits="waSantaClara.Batismo" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %></h2>

    <h3>O Batismo é o momento na vida de um cristão onde recebe para sempre o Espírito Santo de Deus.</h3>

    <h4>No Batismo recebemos o Espírito Santo e deixamos de ser meras criaturas de Deus passando a sermos Filhos de Deus.</h4>
    <p>O batismo é um rito, feito normalmente com água sobre o iniciado através da imersão, efusão ou aspersão. Este rito de iniciação está presente em vários grupos, religiosos ou não, onde destacam-se os cristãos.</p>
    
    <div style="padding: 25px">
        <h3 style="padding-top: 15px"><strong>Agenda 2022</strong></h3>
        
        <div style="padding-top: 25px">
            
            <table id="batismos" runat="server">
                <thead>
                    <tr>
                        <th>Celebrante</th>
                        <th style="padding-left: 20px">Nome</th>
                        <th style="padding-left: 20px">Data</th>
                        <th style="padding-left: 20px">Hora</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Pe. Amado</td>
                        <td style="padding-left: 20px">João Pedro Aparíco Varela</td>
                        <td style="padding-left: 20px">25/10/2022</td>
                        <td style="padding-left: 20px">16:00</td>
                    </tr>
                </tbody>
            </table>

        </div>
    </div>

    <div class="f-wrap-context">
        <asp:GridView ID="requisitos" runat="server" AutoGenerateColumns="False" allowpaging="True" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" ForeColor="Black" GridLines="None" Width="971px">
            <AlternatingRowStyle BackColor="PaleGoldenrod" />
            <Columns>
                <%--<asp:BoundField DataField="id" HeaderText="" />--%>
                <asp:BoundField DataField="requisito" HeaderText="Requisitos" >
                <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                <ItemStyle HorizontalAlign="Left" VerticalAlign="Middle" />
                </asp:BoundField>
               <%-- <asp:BoundField DataField="Quantity" HeaderText="Quantity" />
                <asp:BoundField DataField="Date" HeaderText="Date" />
                <asp:BoundField DataField="Dispatched" HeaderText="Dispatched" />--%>
            </Columns>
            <FooterStyle BackColor="Tan" />
            <HeaderStyle BackColor="Tan" Font-Bold="True" />
            <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
            <SortedAscendingCellStyle BackColor="#FAFAE7" />
            <SortedAscendingHeaderStyle BackColor="#DAC09E" />
            <SortedDescendingCellStyle BackColor="#E1DB9C" />
            <SortedDescendingHeaderStyle BackColor="#C2A47B" />
        </asp:GridView>
    </div>

    <div>        
        <h3><strong>Entenda melhor o que é o Batismo na visão da Igreja Católica. Segundo o plano de amor do Senhor, o batismo é necessário para a salvação.</strong></h3>
        
        <h3><strong>1) O que é o batismo?</strong></h3>
        <p>É o sacramento pelo qual nascemos para a vida e nos tornamos filhos de Deus.</p>

        <h3><strong>2) Por que o batismo é o primeiro dos sacramentos?</strong></h3>
        <p>É o primeiro dos sacramentos porque é a porta que dá acesso aos demais sacramentos, e sem ele não se pode receber nenhum outro.</p>

        <h3><strong>3) Que efeitos produz o batismo?</strong></h3>
        <p>Os efeitos que o batismo produz são: perdoa o pecado original, e qualquer outro pecado, com as penas devidas por eles. Nos dá as três divinas pessoas junto com a graça santificante. Infunde a graça santificante, as virtudes sobrenaturais e os dons do Espírito a graça santificante, as virtudes sobrenaturais e os dons do Espírito Santo. Imprime na alma o caráter sacramental que nos faz cristãos para sempre e somos incorporados à Igreja.</p>

        <h3><strong>4) O Batismo é necessário para a salvação?</strong></h3>
        <p>Segundo o plano do Senhor o batismo é necessário para a salvação, assim como a própria Igreja, à qual o batismo introduz.</p>

        <h3><strong>5) Quem pode batizar?</strong></h3>
        <p>Ordinariamente podem batizar o bispo, o sacerdote e o Diácono, mas em caso de necessidade qualquer pessoa que tenha intenção de fazer o que a Igreja faz.</p>

        <h3><strong>6) Como se batiza?</strong></h3>
        <p>O batizado se realiza derramando água sobre a cabeça e dizendo: “Eu te Batizo em nome do Pai, do Filho e do Espírito Santo”.</p>

        <h3><strong>7) O que é o Catecumenato?</strong></h3>
        <p>É a preparação que devem receber aqueles que serão batizados tendo alcanço o uso da razão.</p>
    </div>
</asp:Content>
