<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="ShowTableData2.aspx.cs" Inherits="adiha.ShowTableData2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
   <style>
        h1{font-weight:bold; font-family:Calibri Light; font-size:45px; text-align:center;}
        body{background-color:azure;}
        h2,h3{font-family:Calibri Light; text-align:center;}
        td,tr,th{text-align:center; font-family:Calibri Light; border:1px solid black; padding:5px 5px 5px 5px;}
        table{border:double; border-width:thick; border-spacing:inherit}
    </style> 
    <h1>טבלת משתמשים</h1>
    <h2><% =sqlSelect %></h2>
    <table border:"1" align="center";>
        <% =st %>
    </table>
    <h3>
        <% =msg %>
    </h3>

</asp:Content>
