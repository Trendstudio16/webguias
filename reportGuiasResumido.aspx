<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="reportGuiasResumido.aspx.cs" Inherits="SistemaWeb.reportGuiasResumido" %>
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
             &nbsp;&nbsp;Reporte Guias Resumido
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
            <dx:ASPxLabel ID="ASPxLabel6" runat="server" Text=" " AssociatedControlID="btnBuscar" /><br />
            <dx:ASPxButton ID="btnBuscar" runat="server" Text="Buscar" OnClick="btnBuscar_Click" ></dx:ASPxButton>
        </div>

        <div style="float: left; padding-bottom: 16px; padding-right: 2%; vertical-align:bottom">
            <dx:ASPxLabel ID="ASPxLabel7" runat="server" Text=" " AssociatedControlID="btnlimpiar" /><br />
            <dx:ASPxButton ID="btnlimpiar" runat="server" Text="Limpiar" OnClick="btnlimpiar_Click" Enabled="false"></dx:ASPxButton>
        </div>
               

        <br />
        <br />
        <br />
        <br />

        <dx:ASPxGridView ID="GridView" runat="server" AutoGenerateColumns="False" KeyFieldName="ID_Guia"       
        ClientInstanceName="gridView"         
        SettingsText-Title="Guias Resumido" 
        OnToolbarItemClick="GridView_ToolbarItemClick">
        
        <SettingsAdaptivity AdaptivityMode="HideDataCells"></SettingsAdaptivity>

        <Settings ShowHeaderFilterButton="true" />

        <SettingsBehavior AllowFocusedRow="true" AllowSelectByRowClick="True" AllowSelectSingleRowOnly="True" AllowEllipsisInText="true" AllowDragDrop="false"></SettingsBehavior>
                    
        <SettingsSearchPanel CustomEditorID="tbToolbarSearch"></SettingsSearchPanel>

        <SettingsPager PageSize="15" EnableAdaptivity="true">
            <PageSizeItemSettings Visible="true"></PageSizeItemSettings>
        </SettingsPager>
        
        <SettingsExport EnableClientSideExportAPI="true" ExportSelectedRowsOnly="false"  />
        
        <ClientSideEvents ToolbarItemClick="onToolbarItemClick" />
        <Toolbars>
            <dx:GridViewToolbar EnableAdaptivity="true">
                <Items>
                    <%--<dx:GridViewToolbarItem Name="New" Text="Nuevo" Image-IconID="actions_additem_16x16office2013" />
                    <dx:GridViewToolbarItem Name="Edit" Text="Editar" Image-IconID="edit_edit_16x16office2013" />
                    <dx:GridViewToolbarItem Name="Delete" Text="Borrar" Image-IconID="actions_deletelist_16x16office2013" />--%>
                   
                    <%-- <dx:GridViewToolbarItem Command="ExportToDocx" Text="Exportar Docx" Image-IconID="export_exporttodocx_16x16" />
                    <dx:GridViewToolbarItem Command="ExportToPdf" Text="Exportar PDF" Image-IconID="export_exporttopdf_16x16" />--%>
                    <%--<dx:GridViewToolbarItem Command="ExportToCsv" />--%>
                    
                    <dx:GridViewToolbarItem Name="Exportar" Text="Exportar a" Image-IconID="actions_download_16x16office2013" BeginGroup="true" AdaptivePriority="2">
                        <Items>
                            <dx:GridViewToolbarItem Name="CustomExportToXLSX" Text="Exportar Xlsx" Image-IconID="export_exporttoxlsx_16x16" />
                            <dx:GridViewToolbarItem Name="CustomExportToDOCX" Text="Exportar Docx" Image-IconID="export_exporttodocx_16x16" />
                            <dx:GridViewToolbarItem Name="CustomExportToPDF" Text="Exportar Pdf" Image-IconID="export_exporttopdf_16x16" />
                        </Items>
                    </dx:GridViewToolbarItem>
                    <dx:GridViewToolbarItem BeginGroup="true" AdaptivePriority="1">
                        <Template>
                            <dx:ASPxButtonEdit ID="tbToolbarSearch" runat="server" NullText="Introduzca el texto a buscar..." Height="100%" ClearButton-DisplayMode="Always" Width="350">
                                <Buttons>
                                    <dx:SpinButtonExtended Image-IconID="print_preview_16x16office2013" />
                                </Buttons>
                            </dx:ASPxButtonEdit>
                        </Template>
                    </dx:GridViewToolbarItem>
                </Items>
            </dx:GridViewToolbar>
        </Toolbars>

        <Columns>
            <dx:GridViewDataDateColumn FieldName="Fecha" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="0" Caption="Fecha" > 
                 <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy" EditFormatString="dd/MM/yyyy">
                </PropertiesDateEdit>
            </dx:GridViewDataDateColumn>  
            
            <dx:GridViewDataTextColumn FieldName="Sucursal_Origen" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="1" Caption="Suc. Origen">
            </dx:GridViewDataTextColumn>

            <dx:GridViewDataTextColumn FieldName="Sucursal_Destino" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="2" Caption="Suc. Destino">
            </dx:GridViewDataTextColumn>

            <dx:GridViewDataTextColumn FieldName="Sucursal_Transito" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="3" Caption="Suc. Transito">
            </dx:GridViewDataTextColumn>
                        
            <dx:GridViewDataTextColumn FieldName="NumeroGuia" UnboundType="Integer" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="4" Caption="Nro. Guia">
                <PropertiesTextEdit DisplayFormatString="n0" />
            </dx:GridViewDataTextColumn>

            <dx:GridViewDataTextColumn FieldName="EstadoGuia" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="5" Caption="Estado">
            </dx:GridViewDataTextColumn>

            <dx:GridViewDataTextColumn FieldName="Cantidad_Bultos" UnboundType="Integer" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="6" Caption="Cant. Bultos">
                <PropertiesTextEdit DisplayFormatString="n0" />
            </dx:GridViewDataTextColumn>
            
            <dx:GridViewDataTextColumn FieldName="Nro_Pedido" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="5" Caption="Nro. Pedido">
            </dx:GridViewDataTextColumn>

            <dx:GridViewDataTextColumn FieldName="TipoEnvio" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="6" Caption="Tipo Envio" Visible="false">
            </dx:GridViewDataTextColumn>

            <dx:GridViewDataTextColumn FieldName="Observaciones" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="7" Caption="Observaciones" Visible="false">
            </dx:GridViewDataTextColumn>

            <dx:GridViewDataTextColumn FieldName="Usuario_Origen" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="8" Caption="Usuario Origen" Visible="false">
            </dx:GridViewDataTextColumn>

            <dx:GridViewDataTextColumn FieldName="Recibe_Destino" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="9" Caption="Recibe en Destino" Visible="false">
            </dx:GridViewDataTextColumn>

            <dx:GridViewDataTextColumn FieldName="Usuario_Transporte" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="10" Caption="Usuario Transporte" Visible="false">
            </dx:GridViewDataTextColumn>

        </Columns>
                    
        <Styles>
            <Cell Wrap="false" />
            <PagerBottomPanel CssClass="pager" />
            <FocusedRow CssClass="focused" />
            <%--<AlternatingRow Enabled="true" />--%>
        </Styles>
            
    </dx:ASPxGridView>



        
        <asp:EntityDataSource runat="server" ID="dataSourceSucursales" OrderBy="it.Sucursal" DefaultContainerName="DB_GuiasEntities" ConnectionString="name=DB_GuiasEntities" EnableFlattening="False" EnableDelete="False" EnableInsert="False" EnableUpdate="False" EntitySetName="Sucursales">
        </asp:EntityDataSource>

    </div>
</asp:Content>
