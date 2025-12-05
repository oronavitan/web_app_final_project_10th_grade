<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="adiha.login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        h1{font-weight:bold; font-family:Calibri Light; font-size:45px; text-align:center;}
        body{background-color:azure;}
        td{font-family:Calibri Light; direction:rtl; text-align:center; font-size:20px; }
    </style>
    
    <h1>התחברו לאתר</h1>
    <table align="center">
        <tr>
            <td><input type="text" name="username" id="username" /></td>
            <td>שם משתמש: </td>
        </tr>
        <tr>
            <td><input type="text" name="password" id="password" /></td>
            <td>סיסמא: </td>
        </tr>
        <tr>
            <td style="text-align:center; padding-top:5px" colspan="2"><input type="submit" name="submit" value="התחבר" /></td>
        </tr>
        <tr>
            <td style="text-align:center; padding-top:5px" colspan="2"><input type="submit" name="idcun" value="לחץ\י כאן לעדכון פרטי המשתמש" /></td>
        </tr>
    </table>
</asp:Content>
