<%@ Page Title="" Language="C#" MasterPageFile="~/Main.master" AutoEventWireup="true" CodeBehind="recepcion.aspx.cs" Inherits="SistemaWeb.recepcion" %>
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
         &nbsp;&nbsp;Recepción de Guias
    </div>

<%--    <dx:ASPxMenu runat="server" ID="PageToolbar" ClientInstanceName="pageToolbar"
        ItemAutoWidth="false" ApplyItemStyleToTemplates="true" ItemWrap="false"
        AllowSelectItem="false" SeparatorWidth="0"
        Width="500px" CssClass="page-toolbar">
        <ClientSideEvents ItemClick="onPageToolbarItemClick" />
        <SettingsAdaptivity Enabled="true" EnableAutoHideRootItems="false" />
        <ItemStyle CssClass="item" VerticalAlign="Middle" />
        <ItemImage Width="16px" Height="16px" />
        <Items>
            <dx:MenuItem Enabled="false">
                <Template>                    
                        &nbsp;&nbsp;&nbsp; 
                    --<dx:aspxlabel ID="lblTitulo" runat="server" Font-Bold="true" ForeColor="#1279C0" Text="Sucursales" />--
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
        DataSourceID="dataSourceGuias" KeyFieldName="ID_Guia" 
        ClientInstanceName="gridView" 
        SettingsText-Title="Guias" 
        OnToolbarItemClick="GridView_ToolbarItemClick"
        OnInit="GridView_Init"
        >
        
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
                    <dx:GridViewToolbarItem Name="New" Text="Nuevo" AdaptivePriority="6" Image-IconID="actions_additem_16x16office2013" Visible="false" />
                    <dx:GridViewToolbarItem Name="Edit" Text="Editar" AdaptivePriority="5" Image-IconID="edit_edit_16x16office2013" Visible="false"/>
                    <dx:GridViewToolbarItem Name="Delete" Text="Borrar" AdaptivePriority="4" Image-IconID="actions_deletelist_16x16office2013" Visible="false"/>
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

            <dx:GridViewDataButtonEditColumn VisibleIndex="0" Width="160px">  
                    <DataItemTemplate>
                        <div style="width:100%; text-align:center"> 
                            <dx:ASPxButton ID="btnRecibir" runat="server" OnClick="btnRecibir_Click"
                                Text="Recibir Guia" AutoPostBack="false" OnInit="btnRecibir_Init" >  
                            </dx:ASPxButton>  
                        </div>
                    </DataItemTemplate>  
            </dx:GridViewDataButtonEditColumn>

            <dx:GridViewDataTextColumn FieldName="ID_Guia" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="1" Caption="ID" Width="100" Visible="false">
                <EditFormSettings Visible="False" />  
            </dx:GridViewDataTextColumn>
                                    
            <dx:GridViewDataComboBoxColumn FieldName="ID_Sucursal_Origen" ShowInCustomizationForm="True" VisibleIndex="2" Caption="Suc. Origen">
                <PropertiesComboBox ValueField="ID_Sucursal" TextField="Sucursal" ValueType="System.Int32" DataSourceID="dataSourceSucursales">
                    <ValidationSettings ErrorDisplayMode="ImageWithText" Display="Dynamic" ErrorTextPosition="Bottom">
                        <RequiredField IsRequired="True" ErrorText="El valor es requerido."></RequiredField>
                    </ValidationSettings>
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            
            <dx:GridViewDataComboBoxColumn FieldName="ID_Usuario_Origen" ShowInCustomizationForm="True" VisibleIndex="3" Caption="Usuario Origen" Visible="false">
                <EditFormSettings Visible="false" />
                <PropertiesComboBox ValueField="ID_Usuario" TextField="Usuario" ValueType="System.Int32" DataSourceID="dataSourceUsuarios">
                    <ValidationSettings ErrorDisplayMode="ImageWithText" Display="Dynamic" ErrorTextPosition="Bottom">
                        <RequiredField IsRequired="True" ErrorText="El valor es requerido."></RequiredField>
                    </ValidationSettings>
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>

            <dx:GridViewDataComboBoxColumn FieldName="ID_Sucursal_Destino" ShowInCustomizationForm="True" VisibleIndex="4" Caption="Suc. Destino">
                <PropertiesComboBox ValueField="ID_Sucursal" TextField="Sucursal" ValueType="System.Int32" DataSourceID="dataSourceSucursales">
                    <ValidationSettings ErrorDisplayMode="ImageWithText" Display="Dynamic" ErrorTextPosition="Bottom">
                        <RequiredField IsRequired="True" ErrorText="El valor es requerido."></RequiredField>
                    </ValidationSettings>
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            
            <dx:GridViewDataTextColumn FieldName="Recibe_Destino" ShowInCustomizationForm="True" VisibleIndex="5" Caption="Recibe en Destino" Visible="false">
                <EditFormSettings Visible="true" />
                <PropertiesTextEdit >
                    <ValidationSettings ErrorDisplayMode="ImageWithText" Display="Dynamic" ErrorTextPosition="Bottom">
                        <RequiredField IsRequired="True" ErrorText="El valor es requerido."></RequiredField>
                    </ValidationSettings>
                </PropertiesTextEdit>
            </dx:GridViewDataTextColumn>
            
            <dx:GridViewDataComboBoxColumn FieldName="ID_Sucursal_Transito" ShowInCustomizationForm="True" VisibleIndex="6" Caption="Suc. Transito" Visible="true">
                <EditFormSettings Visible="false" />
                <PropertiesComboBox ValueField="ID_Sucursal" TextField="Sucursal" ValueType="System.Int32" DataSourceID="dataSourceSucursales">
                    <ValidationSettings ErrorDisplayMode="ImageWithText" Display="Dynamic" ErrorTextPosition="Bottom">
                        <RequiredField IsRequired="True" ErrorText="El valor es requerido."></RequiredField>
                    </ValidationSettings>
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>

            <dx:GridViewDataComboBoxColumn FieldName="ID_TipoEnvio" ShowInCustomizationForm="True" VisibleIndex="7" Caption="Tipo Envio">
                <PropertiesComboBox ValueField="ID_TipoEnvio" TextField="TipoEnvio" ValueType="System.Int32" DataSourceID="dataSourceTiposEnvio">
                    <ValidationSettings ErrorDisplayMode="ImageWithText" Display="Dynamic" ErrorTextPosition="Bottom">
                        <RequiredField IsRequired="True" ErrorText="El valor es requerido."></RequiredField>
                    </ValidationSettings>
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>

            <dx:GridViewDataSpinEditColumn FieldName="Cantidad_Bultos" ShowInCustomizationForm="True" VisibleIndex="8" Caption="Cant. Bultos">
              <PropertiesSpinEdit DisplayFormatString="N0" NumberType="integer"  
                NumberFormat="Number"  DecimalPlaces="0" DisplayFormatInEditMode="True" MinValue="1" MaxValue="999">  
                  <SpinButtons ShowIncrementButtons="False"></SpinButtons>  
                  <ValidationSettings ErrorDisplayMode="ImageWithText" Display="Dynamic" ErrorTextPosition="Bottom">
                        <RequiredField IsRequired="True" ErrorText="El valor es requerido."></RequiredField>
                    </ValidationSettings>
              </PropertiesSpinEdit>
            </dx:GridViewDataSpinEditColumn>
            
            <dx:GridViewDataTextColumn FieldName="Observaciones" ShowInCustomizationForm="True" VisibleIndex="9" Visible="false">
                <EditFormSettings Visible="true" />
            </dx:GridViewDataTextColumn>
            
            <dx:GridViewDataTextColumn FieldName="Nro_Pedido" ShowInCustomizationForm="True" VisibleIndex="10" Caption="Nro. Pedido" Visible="true"></dx:GridViewDataTextColumn>
            
            <dx:GridViewDataDateColumn FieldName="Fecha" ShowInCustomizationForm="True" VisibleIndex="11" Caption="Fecha" Visible="true">
                <EditFormSettings Visible="false" />
                <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy" EditFormatString="dd/MM/yyyy">
                    <ValidationSettings ErrorDisplayMode="ImageWithText" Display="Dynamic" ErrorTextPosition="Bottom">
                        <RequiredField IsRequired="True" ErrorText="El valor es requerido."></RequiredField>
                    </ValidationSettings>
                </PropertiesDateEdit>
            </dx:GridViewDataDateColumn>  

            <dx:GridViewDataTextColumn FieldName="NumeroGuia" ShowInCustomizationForm="True" VisibleIndex="12" Caption="Nº Guia" Visible="true">
                 <EditFormSettings Visible="False" />
             </dx:GridViewDataTextColumn>
                                   
            <dx:GridViewDataComboBoxColumn FieldName="ID_Usuario_Creacion" ShowInCustomizationForm="True" VisibleIndex="13" Caption="Usuario Creación" Visible="false">
                <EditFormSettings Visible="false" />
                <PropertiesComboBox ValueField="ID_Usuario" TextField="Usuario" ValueType="System.Int32" DataSourceID="dataSourceUsuarios">
                    <ValidationSettings ErrorDisplayMode="ImageWithText" Display="Dynamic" ErrorTextPosition="Bottom">
                        <RequiredField IsRequired="True" ErrorText="El valor es requerido."></RequiredField>
                    </ValidationSettings>
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>

            <dx:GridViewDataComboBoxColumn FieldName="ID_Usuario_Ult_Modif" ShowInCustomizationForm="True" VisibleIndex="14" Caption="Usuario Ult. Modif." Visible="false">
                <EditFormSettings Visible="false" />
                <PropertiesComboBox ValueField="ID_Usuario" TextField="Usuario" ValueType="System.Int32" DataSourceID="dataSourceUsuarios">
                    <ValidationSettings ErrorDisplayMode="ImageWithText" Display="Dynamic" ErrorTextPosition="Bottom">
                        <RequiredField IsRequired="True" ErrorText="El valor es requerido."></RequiredField>
                    </ValidationSettings>
                </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>

            <dx:GridViewDataTextColumn FieldName="EstadoGuia" ShowInCustomizationForm="True" VisibleIndex="15" Caption="Estado Guia" Visible="true">
                 <EditFormSettings Visible="False" />
             </dx:GridViewDataTextColumn>

            <dx:GridViewDataDateColumn FieldName="Fecha_Creacion" ShowInCustomizationForm="True" VisibleIndex="16" Caption="Fecha Creacion" Visible="false">
                <EditFormSettings Visible="false" />
                <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy" EditFormatString="dd/MM/yyyy">
                    <ValidationSettings ErrorDisplayMode="ImageWithText" Display="Dynamic" ErrorTextPosition="Bottom">
                        <RequiredField IsRequired="True" ErrorText="El valor es requerido."></RequiredField>
                    </ValidationSettings>
                </PropertiesDateEdit>
            </dx:GridViewDataDateColumn>  

            <dx:GridViewDataDateColumn FieldName="Fecha_Ult_Modif" ShowInCustomizationForm="True" VisibleIndex="17" Caption="Fecha Ult. Modif" Visible="false">
                <EditFormSettings Visible="false" />
                <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy" EditFormatString="dd/MM/yyyy">
                    <ValidationSettings ErrorDisplayMode="ImageWithText" Display="Dynamic" ErrorTextPosition="Bottom">
                        <RequiredField IsRequired="True" ErrorText="El valor es requerido."></RequiredField>
                    </ValidationSettings>
                </PropertiesDateEdit>
            </dx:GridViewDataDateColumn>  

        </Columns>

        <Styles>
            <Cell Wrap="false" />
            <PagerBottomPanel CssClass="pager" />
            <FocusedRow CssClass="focused" />
            <AlternatingRow Enabled="true" />
        </Styles>
                
    </dx:ASPxGridView>

        

    <asp:EntityDataSource runat="server" ID="dataSourceUsuarios" AutoGenerateWhereClause="true" DefaultContainerName="DB_GuiasEntities" ConnectionString="name=DB_GuiasEntities" EnableFlattening="False" EnableDelete="False" EnableInsert="False" EnableUpdate="False" EntitySetName="Usuarios">
        <WhereParameters>
            <asp:Parameter DbType="Boolean" DefaultValue="false" Name="Inhabilitado" />
        </WhereParameters> 
    </asp:EntityDataSource>
    <asp:EntityDataSource runat="server" ID="dataSourceSucursales" AutoGenerateWhereClause="true" DefaultContainerName="DB_GuiasEntities" ConnectionString="name=DB_GuiasEntities" EnableFlattening="False" EnableDelete="False" EnableInsert="False" EnableUpdate="False" EntitySetName="Sucursales">
        <WhereParameters>
            <asp:Parameter DbType="Boolean" DefaultValue="false" Name="Inhabilitado" />
        </WhereParameters> 
    </asp:EntityDataSource>    
    <asp:EntityDataSource runat="server" ID="dataSourceTiposEnvio" AutoGenerateWhereClause="true" DefaultContainerName="DB_GuiasEntities" ConnectionString="name=DB_GuiasEntities" EnableFlattening="False" EnableDelete="False" EnableInsert="False" EnableUpdate="False" EntitySetName="TiposEnvio">
        <WhereParameters>
            <asp:Parameter DbType="Boolean" DefaultValue="false" Name="Inhabilitado" />
        </WhereParameters> 
    </asp:EntityDataSource>
    <asp:EntityDataSource runat="server" ID="dataSourceGuias" AutoGenerateWhereClause="false" OrderBy="it.ID_Guia desc" DefaultContainerName="DB_GuiasEntities" ConnectionString="name=DB_GuiasEntities" EnableFlattening="False" EnableDelete="False" EnableInsert="False" EnableUpdate="False" EntitySetName="Guias">        
    </asp:EntityDataSource>
    
    </div>

</asp:Content>
