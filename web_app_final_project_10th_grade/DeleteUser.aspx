<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="DeleteUser.aspx.cs" Inherits="adiha.DeleteUser" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div align="center">
    <style>
        h1{font-weight:bold; font-family:Calibri Light; font-size:45px;}
        h2{font-weight:bold; font-family:Calibri Light; font-size:30px;}
        body{background-color:azure;}
        h3{font-family:Calibri Light;}
        table{font-family:Calibri Light; direction:rtl; text-align:center; font-size:20px; border:2px solid black; margin:0px auto; }
    </style>
    
    <h1>שלום מנהל</h1>
    <h2> טבלת משתמשים</h2>
    <table>
         <%=st %>
     </table>
    </div>

    <%=msg %>

</asp:Content>
