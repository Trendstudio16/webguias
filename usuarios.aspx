<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="usuarios.aspx.cs" Inherits="SistemaWeb.usuarios" %>
<%@ MasterType VirtualPath="~/Main.master" %>

<asp:Content ID="Content2" ContentPlaceHolderID="Head" runat="server">
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

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div id="СontrolAreaBlock" class="control-area" style="max-width:960px;min-height:300px;" >

    <div id="HeaderWrapper" class="" style="max-width:960px;color:#1279C0;font-size:xx-large" >
         &nbsp;&nbsp;Usuarios
    </div>

<%--    <dx:ASPxMenu runat="server" ID="PageToolbar" ClientInstanceName="pageToolbar"
        ItemAutoWidth="false" ApplyItemStyleToTemplates="true" ItemWrap="false"
        AllowSelectItem="false" SeparatorWidth="0"
        Width="500px" CssClass="page-toolbar">
        <ClientSideEvents ItemClick="onPageToolbarItemClick" />
        <SettingsAdaptivity Enabled="true" EnableAutoHideRootItems="true" />
        <ItemStyle CssClass="item" VerticalAlign="Middle" />
        <ItemImage Width="16px" Height="16px" />
        <Items>
            <dx:MenuItem Enabled="false">
                <Template>                    
                    &nbsp;&nbsp;&nbsp; 
                    --<dx:aspxlabel ID="lblTitulo" runat="server" Font-Bold="true" ForeColor="#1279C0" Text="USUARIOS" />--
                    &nbsp;&nbsp;
                </Template>
            </dx:MenuItem>
            <dx:MenuItem Name="New" Text="Nuevo" AdaptivePriority="2">
                <Image Url="Content/Images/add.svg" />
            </dx:MenuItem>
            <dx:MenuItem Name="Edit" Text="Editar" AdaptivePriority="2">
                <Image Url="Content/Images/edit.svg" />
            </dx:MenuItem>
            <dx:MenuItem Name="Delete" Text="Borrar" AdaptivePriority="2">
                <Image Url="Content/Images/delete.svg" />
            </dx:MenuItem>
            <dx:MenuItem Name="Export" Text="Exportar" AdaptivePriority="2">
                <Image Url="Content/Images/export.svg" />
            </dx:MenuItem>
        </Items>
    </dx:ASPxMenu>--%>


    <dx:ASPxGridView ID="GridView" runat="server" AutoGenerateColumns="False" 
        DataSourceID="dataSourceUsuarios" KeyFieldName="ID_Usuario" 
        onRowValidating="GridView_RowValidating"
        onRowDeleting="GridView_RowDeleting"
        ClientInstanceName="gridView" 
        OnCustomCallback="GridView_CustomCallback"
        OnStartRowEditing="GridView_StartRowEditing"
        OnLoad="GridView_Load"
        OnCellEditorInitialize="GridView_CellEditorInitialize"
        OnBeforeGetCallbackResult="GridView_BeforeGetCallbackResult"        
        SettingsText-Title="Usuarios" 
        OnToolbarItemClick="GridView_ToolbarItemClick"
        OnInit="GridView_Init">

        <ClientSideEvents EndCallback="function(s, e) {  
                                    if (s.cpMessage) { //check  
                                        alert(s.cpMessage); //alert  
                                        delete s.cpMessage; //delete  
                                    }  
                                }"  />
        <SettingsAdaptivity AdaptivityMode="HideDataCells"></SettingsAdaptivity>

        <SettingsEditing Mode="PopupEditForm" EditFormColumnCount="2"></SettingsEditing>
        
        <SettingsPopup>
            <EditForm>
                <SettingsAdaptivity MaxWidth="800" Mode="Always" VerticalAlign="WindowCenter" />
            </EditForm>
        </SettingsPopup>

        <Templates>  
            <EditForm>  
                <dx:ASPxGridViewTemplateReplacement ID="Editors" ReplacementType="EditFormEditors" runat="server">  
                </dx:ASPxGridViewTemplateReplacement>  

                <div style="padding: 5px; text-align: right">  
                    <dx:ASPxButton ID="btnSave" runat="server" Text="Grabar" AutoPostBack="false">  
                        <ClientSideEvents Click="function(s, e) { gridView.UpdateEdit(); }" />  
                    </dx:ASPxButton>  

                    <dx:ASPxButton ID="btnCancel" runat="server" Text="Cancelar" AutoPostBack="false">  
                        <ClientSideEvents Click="function(s, e) { gridView.CancelEdit(); }" />  
                    </dx:ASPxButton>  
                </div>  
            </EditForm>  
        </Templates>  

        <Settings ShowHeaderFilterButton="true" />

        <SettingsBehavior AllowFocusedRow="true" AllowSelectByRowClick="True" AllowSelectSingleRowOnly="True" AllowEllipsisInText="true" AllowDragDrop="false"></SettingsBehavior>

        <SettingsSearchPanel CustomEditorID="tbToolbarSearch"></SettingsSearchPanel>
        
        <SettingsPager PageSize="15" EnableAdaptivity="true">
            <PageSizeItemSettings Visible="true"></PageSizeItemSettings>
        </SettingsPager>
        
        <SettingsExport EnableClientSideExportAPI="true" ExportSelectedRowsOnly="false" />

        <ClientSideEvents ToolbarItemClick="onToolbarItemClick" />
        <Toolbars>
            <dx:GridViewToolbar EnableAdaptivity="true" Name="Toolbar" ItemAlign="Left">
                <Items>
                    <dx:GridViewToolbarItem Name="New" Text="Nuevo" AdaptivePriority="6" Image-IconID="actions_additem_16x16office2013" />
                    <dx:GridViewToolbarItem Name="Edit" Text="Editar" AdaptivePriority="5" Image-IconID="edit_edit_16x16office2013" />
                    <dx:GridViewToolbarItem Name="Delete" Text="Borrar" AdaptivePriority="4" Image-IconID="actions_deletelist_16x16office2013" />
                    <dx:GridViewToolbarItem Name="Refresh" Text="Actualizar" BeginGroup="true" AdaptivePriority="3" Image-IconID="actions_refresh_16x16office2013" />
                   
                    <%-- 
                    <dx:GridViewToolbarItem Command="ExportToDocx" Text="Exportar Docx" Image-IconID="export_exporttodocx_16x16" />
                    <dx:GridViewToolbarItem Command="ExportToPdf" Text="Exportar PDF" Image-IconID="export_exporttopdf_16x16" />
                    <dx:GridViewToolbarItem Command="ExportToCsv" />
                    --%>
                    
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
            <%--<dx:GridViewCommandColumn ShowSelectCheckbox="True" VisibleIndex="0" Caption="Sel." Width="60"></dx:GridViewCommandColumn>--%>
            <dx:GridViewDataTextColumn FieldName="ID_Usuario" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="1" Caption="ID" Width="100" Visible="false">
                <EditFormSettings Visible="False" />  
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Usuario" ShowInCustomizationForm="True" VisibleIndex="2">
                <PropertiesTextEdit>
                    <ValidationSettings ErrorDisplayMode="ImageWithText" Display="Dynamic" ErrorTextPosition="Bottom">
                        <RequiredField IsRequired="True" ErrorText="El valor es requerido."></RequiredField>
                    </ValidationSettings>
                </PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Contrase&#241;a" ShowInCustomizationForm="True" VisibleIndex="3">
                <PropertiesTextEdit Password="True">                
                    <ValidationSettings ErrorDisplayMode="ImageWithText" Display="Dynamic" ErrorTextPosition="Bottom">
                        <RequiredField IsRequired="True" ErrorText="El valor es requerido."></RequiredField>
                    </ValidationSettings>
                </PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataComboBoxColumn FieldName="ID_TipoUsuario" ShowInCustomizationForm="True" VisibleIndex="4" Caption="Tipo de Usuario">
                <PropertiesComboBox ValueField="ID_TipoUsuario" TextField="TipoUsuario" ValueType="System.Int32" DataSourceID="dataSourceTiposUsuario">
                    <ValidationSettings ErrorDisplayMode="ImageWithText" Display="Dynamic" ErrorTextPosition="Bottom">
                        <RequiredField IsRequired="True" ErrorText="El valor es requerido."></RequiredField>
                    </ValidationSettings>
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataComboBoxColumn FieldName="ID_Sucursal" ShowInCustomizationForm="True" VisibleIndex="5" Caption="Sucursal">
                <PropertiesComboBox ValueField="ID_Sucursal" TextField="Sucursal" ValueType="System.Int32" DataSourceID="dataSourceSucursales" DropDownStyle="DropDown" IncrementalFilteringMode="Contains" DropDownRows="5">
                    <ValidationSettings ErrorDisplayMode="ImageWithText" Display="Dynamic" ErrorTextPosition="Bottom">
                        <RequiredField IsRequired="False" ErrorText="El valor es requerido."></RequiredField>
                    </ValidationSettings>
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataTextColumn FieldName="Descripcion" ShowInCustomizationForm="True" VisibleIndex="6"></dx:GridViewDataTextColumn>
            <dx:GridViewDataCheckColumn FieldName="Inhabilitado" ShowInCustomizationForm="True" VisibleIndex="7"></dx:GridViewDataCheckColumn>
        </Columns>

        <Styles>
            <Cell Wrap="false" />
            <PagerBottomPanel CssClass="pager" />
            <FocusedRow CssClass="focused" />
        </Styles>

        

    </dx:ASPxGridView>
        
    <asp:EntityDataSource runat="server" ID="dataSourceTiposUsuario" DefaultContainerName="DB_GuiasEntities" ConnectionString="name=DB_GuiasEntities" EnableFlattening="False" EnableDelete="False" EnableInsert="False" EnableUpdate="False" EntitySetName="TiposUsuario"></asp:EntityDataSource>
    <asp:EntityDataSource runat="server" ID="dataSourceUsuarios" DefaultContainerName="DB_GuiasEntities" ConnectionString="name=DB_GuiasEntities" EnableFlattening="False" EnableDelete="True" EnableInsert="True" EnableUpdate="True" EntitySetName="Usuarios"></asp:EntityDataSource>
    <asp:EntityDataSource runat="server" ID="dataSourceSucursales" DefaultContainerName="DB_GuiasEntities" ConnectionString="name=DB_GuiasEntities" EnableFlattening="False" EnableDelete="False" EnableInsert="False" EnableUpdate="False" EntitySetName="Sucursales"></asp:EntityDataSource>

</div>

</asp:Content>
