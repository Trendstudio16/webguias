<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="pass.aspx.cs" Inherits="SistemaWeb.pass" %>
<%@ MasterType VirtualPath="~/Main.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
        <link rel="stylesheet" type="text/css" href='Content/GridView.css' />
    <link rel="stylesheet" type="text/css" href='Content/Content.css' />
    <link rel="stylesheet" type="text/css" href='Content/Layout.css' />
    <script type="text/javascript" src='Content/GridView.js'></script>    
    <style>
    .control-area 
    {
        display: inline-block;
        box-sizing: border-box;
        width: 100%;
        padding-left: 15px;
        padding-right: 10px;
        padding-bottom: 10px;
        padding-top: 5px;    
    }    
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div id="divmessage" runat="server" />

    <div id="СontrolAreaBlock" class="control-area" style="max-width:960px;min-height:300px;" >

        <div id="HeaderWrapper" class="" style="max-width:960px;color:#1279C0;font-size:xx-large" >
             &nbsp;&nbsp;Cambio de Contraseña
        </div>

        <dx:ASPxPopupControl ID="ASPxPopupControl1" HeaderText="Error Cambio de Contraseña" runat="server" ClientInstanceName="popupControl" Height="100px" Modal="True" CloseAction="CloseButton" Width="300px" AllowDragging="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter">
            <ContentCollection>
                <dx:PopupControlContentControl runat="server">
                    <div runat="server" id="msjErr"> Error: </div>
                    <dx:ASPxMemo ID="txtMemo" runat="server" Height="100px" Width="295px" ForeColor="#406a91" Font-Bold="true"></dx:ASPxMemo>

                     <%--<dx:ASPxTextBox ID="txtPopup" runat="server" Width="295px" ClientInstanceName="txtPopup" ForeColor="#406a91" Font-Bold="true">
                                </dx:ASPxTextBox>--%>
                                <br/><br/>
                                            
                    <table style="border:none;">
                        <tr>
                            <td>
                                <dx:ASPxButton ID="btnCancel" runat="server" AutoPostBack="False" ClientInstanceName="btnCancel"
                                    Text="Cerrar" Width="100px">
                                    <ClientSideEvents Click="function(s, e) {
	                                                                popupControl.Hide();
                                                                }" />
                                    </dx:ASPxButton>
                            </td>
                        </tr>
                    </table>
                                            
                </dx:PopupControlContentControl>
            </ContentCollection>
        </dx:ASPxPopupControl>

        <br />
        <br />


        <div style="float: left; padding-bottom: 16px; padding-right: 2%">
         <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Contraseña Actual:" AssociatedControlID="ASPxTextBoxPassOld" />
            <dx:ASPxTextBox ID="ASPxTextBoxPassOld" runat="server" Width="200px" Password="true">
                <ValidationSettings ErrorDisplayMode="ImageWithTooltip" Display="Dynamic" ErrorTextPosition="Left">
                 <RequiredField IsRequired="True" ErrorText="El valor es requerido."></RequiredField>
             </ValidationSettings>
            </dx:ASPxTextBox>
        </div>
        <br />
        <br />
        <br />
        <br />

        <div style="float: left; padding-bottom: 16px; padding-right: 2%">
         <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Nueva Contraseña:" AssociatedControlID="ASPxTextBoxPassNew" />
            <dx:ASPxTextBox ID="ASPxTextBoxPassNew" runat="server" Width="200px" Password="true">
                <ValidationSettings ErrorDisplayMode="ImageWithTooltip" Display="Dynamic" ErrorTextPosition="Left">
                 <RequiredField IsRequired="True" ErrorText="El valor es requerido."></RequiredField>
             </ValidationSettings>
            </dx:ASPxTextBox>
        </div>

        <div style="float: left; padding-bottom: 16px; padding-right: 2%">
         <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="Repita Nueva Contraseña:" AssociatedControlID="ASPxTextBoxPassNew2" />
            <dx:ASPxTextBox ID="ASPxTextBoxPassNew2" runat="server" Width="200px" Password="true">
                <ValidationSettings ErrorDisplayMode="ImageWithTooltip" Display="Dynamic" ErrorTextPosition="Left">
                 <RequiredField IsRequired="True" ErrorText="El valor es requerido."></RequiredField>
             </ValidationSettings>
            </dx:ASPxTextBox>
        </div>




        <div style="float: left; padding-bottom: 16px; padding-right: 2%;">
            <dx:ASPxLabel ID="ASPxLabel4" runat="server" Text=" " AssociatedControlID="btnModificar" /><br />
            <dx:ASPxButton ID="btnModificar" runat="server" Text="Modificar" OnClick="btnModificar_Click" ></dx:ASPxButton>
        </div>
                
        



    </div>
</asp:Content>
