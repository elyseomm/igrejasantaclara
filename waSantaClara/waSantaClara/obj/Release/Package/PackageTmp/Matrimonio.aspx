<%@ Page Title="Matrimônios" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Matrimonio.aspx.cs" Inherits="waSantaClara.Matrimonio" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %></h2>
    <h3>O Matrimônio é um sacramento instituído por Deus</h3>
    
    <h4>Matrimonio - Apenas através dele o homem pode se relacionar intimamento com o sexo oposto.</h4>

    <div style="padding: 25px">
        <h3 style="padding-top: 15px"><strong>Agenda 2022</strong></h3>
        <div style="padding-top: 25px">
            <table id="matrimonios" runat="server">
                <thead>
                    <tr>
                        <th>Celebrante</th>
                        <th style="padding-left: 20px">Noivos</th>
                        <th style="padding-left: 20px">Data</th>
                        <th style="padding-left: 20px">Hora</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Pe. Amado</td>
                        <td style="padding-left: 20px">Aparício Varela & Jenifer Matuza</td>
                        <td style="padding-left: 20px">18/11/2022</td>
                        <td style="padding-left: 20px">19:00</td>
                    </tr>
                    <tr>
                        <td>Pe. Enoque</td>
                        <td style="padding-left: 20px">Abtibol Gumercindo da Silva & Marielvia Pirigueira Tortuosa</td>            
                        <td style="padding-left: 20px">02/12/2022</td>
                        <td style="padding-left: 20px">19:00</td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
        
    <p>Entenda melhor o que é o Matrimônio segundo a igreja católica:</p>
    <p>
        <a class="btn btn-danger" href="https://www.vatican.va/archive/cathechism_po/index_new/p2s2cap3_1533-1666_po.html#ARTIGO_7_">O Matrimônio Católico  &raquo;
        </a>
    </p>
</asp:Content>
