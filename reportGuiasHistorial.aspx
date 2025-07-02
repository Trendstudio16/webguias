<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="reportGuiasHistorial.aspx.cs" Inherits="SistemaWeb.reportGuiasHistorial" %>

<%@ Register Assembly="DevExpress.XtraReports.v18.1.Web.WebForms, Version=18.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraReports.Web" TagPrefix="dx" %>
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
    <div id="СontrolAreaBlock" class="control-area" style="max-width:1400px;min-height:300px;" >

        <div id="HeaderWrapper" class="" style="max-width:960px;color:#1279C0;font-size:xx-large" >
             &nbsp;&nbsp;Reporte Guias Historial
        </div>

        <dx:ASPxPopupControl ID="ASPxPopupControl1" HeaderText="Error Reporte Acopios" runat="server" ClientInstanceName="popupControl" Height="100px" Modal="True" CloseAction="CloseButton" Width="300px" AllowDragging="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter">
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
         <dx:ASPxLabel ID="ASPxLabel5" runat="server" Text="Estado Guia:" AssociatedControlID="ASPxCMBEstadoGuia" />
         <dx:ASPxComboBox ID="ASPxCMBEstadoGuia" runat="server" Width="130">
             <ValidationSettings ErrorDisplayMode="ImageWithTooltip" Display="Dynamic" ErrorTextPosition="Left">
                 <RequiredField IsRequired="True" ErrorText="El valor es requerido."></RequiredField>
             </ValidationSettings>
             <Items>
                 <dx:ListEditItem Text="Todos" Value="Todos" Selected="true"></dx:ListEditItem>
                 <dx:ListEditItem Text="Emitida" Value="Emitida"></dx:ListEditItem>
                 <dx:ListEditItem Text="EmitidaTpe" Value="EmitidaTpe"></dx:ListEditItem>
                 <dx:ListEditItem Text="Transito" Value="Transito"></dx:ListEditItem>
                 <dx:ListEditItem Text="TransitoTpe" Value="TransitoTpe"></dx:ListEditItem>
                 <dx:ListEditItem Text="Recibida" Value="Recibida"></dx:ListEditItem>
             </Items>
         </dx:ASPxComboBox>
        </div>

        <div style="float: left; padding-bottom: 16px; padding-right: 2%">
         <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Suc. Origen:" AssociatedControlID="ASPxCMBSucursalOrigen" />
         <dx:ASPxComboBox ID="ASPxCMBSucursalOrigen" runat="server" Width="130"
            ValueField="ID_Sucursal" TextField="Sucursal" ValueType="System.Int32" DataSourceID="dataSourceSucursales">   
             <ClientSideEvents KeyDown="function(s, e) {  
                                        if(e.htmlEvent.keyCode == 46 /* Delete */);  
                                            s.SetValue(null);  
                                    }" />
         </dx:ASPxComboBox>
        </div>

        <div style="float: left; padding-bottom: 16px; padding-right: 2%">
         <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Suc. Destino:" AssociatedControlID="ASPxCMBSucursalDestino" />
         <dx:ASPxComboBox ID="ASPxCMBSucursalDestino" runat="server" Width="130"
            ValueField="ID_Sucursal" TextField="Sucursal" ValueType="System.Int32" DataSourceID="dataSourceSucursales">
             <ClientSideEvents KeyDown="function(s, e) {  
                                        if(e.htmlEvent.keyCode == 46 /* Delete */);  
                                            s.SetValue(null);  
                                    }" />
         </dx:ASPxComboBox>
        </div>

        <div style="float: left; padding-bottom: 16px; padding-right: 2%">
         <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="Suc. Transito:" AssociatedControlID="ASPxCMBSucursalTransito" />
         <dx:ASPxComboBox ID="ASPxCMBSucursalTransito" runat="server" Width="130"
            ValueField="ID_Sucursal" TextField="Sucursal" ValueType="System.Int32" DataSourceID="dataSourceSucursales">
             <ClientSideEvents KeyDown="function(s, e) {  
                                        if(e.htmlEvent.keyCode == 46 /* Delete */);  
                                            s.SetValue(null);  
                                    }" />
         </dx:ASPxComboBox>
        </div>

        <div style="float: left; padding-bottom: 16px; padding-right: 2%">
         <dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="Nro. Guia:" AssociatedControlID="ASPxTxtNroGuia" />
            <dx:ASPxTextBox ID="ASPxTxtNroGuia" runat="server" Width="170px" MaxLength="20">                
            </dx:ASPxTextBox>
        </div>

        <div style="float: left; padding-bottom: 16px; padding-right: 2%;">
            <dx:ASPxLabel ID="ASPxLabel6" runat="server" Text=" " AssociatedControlID="btnGenerar" /><br />
            <dx:ASPxButton ID="btnGenerar" runat="server" Text="Generar" OnClick="btnGenerar_Click" UseSubmitBehavior="false" ></dx:ASPxButton>
        </div>

        <div style="float: left; padding-bottom: 16px; padding-right: 2%; vertical-align:bottom">
            <dx:ASPxLabel ID="ASPxLabel7" runat="server" Text=" " AssociatedControlID="btnlimpiar" /><br />
            <dx:ASPxButton ID="btnlimpiar" runat="server" Text="Limpiar" OnClick="btnlimpiar_Click" Enabled="false"></dx:ASPxButton>
        </div>
               

        <br />
        <br />
        <br />
        <br />

        
        <dx:ASPxWebDocumentViewer ID="ASPxWebDocumentViewer" runat="server" Visible="false"></dx:ASPxWebDocumentViewer>


        
        <asp:EntityDataSource runat="server" ID="dataSourceSucursales" OrderBy="it.Sucursal" DefaultContainerName="DB_GuiasEntities" ConnectionString="name=DB_GuiasEntities" EnableFlattening="False" EnableDelete="False" EnableInsert="False" EnableUpdate="False" EntitySetName="Sucursales">
        </asp:EntityDataSource>

    </div>
</asp:Content>
