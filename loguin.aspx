<%@ Page Title="" Language="C#" MasterPageFile="~/Light.master" AutoEventWireup="true" CodeBehind="loguin.aspx.cs" Inherits="SistemaWeb.loguin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <br />
            <br />
            <br />
    <div style="padding: 20px">
        <dx:ASPxFormLayout ID="formLayout" runat="server" ClientInstanceName="formLayout" UseDefaultPaddings="false">
        <SettingsAdaptivity AdaptivityMode="SingleColumnWindowLimit"  GridSettings-WrapCaptionAtWidth="100" SwitchToSingleColumnAtWindowInnerWidth="450"/>
        <Items>            
            <dx:LayoutGroup Name="UserInfo" GroupBoxDecoration="Box" Caption="Ingreso al Sistema" Width="100%" UseDefaultPaddings="false">
                <Items>
                    <dx:LayoutItem Caption="Usuario" Name="usuario">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer>
                                <dx:ASPxTextBox runat="server" ID="txtUsuario" Width="100%">
                                    <ValidationSettings ErrorDisplayMode="ImageWithText" Display="Dynamic" ErrorTextPosition="Bottom" SetFocusOnError="true">                                        
                                        <RequiredField IsRequired="True" ErrorText="Ingrese Usuario" />
                                    </ValidationSettings>
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    <dx:LayoutItem Caption="Contraseña" Name="contraseña">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer>
                                <dx:ASPxTextBox ID="txtPassword" runat="server" Password="true" Width="100%">
                                    <ValidationSettings ErrorTextPosition="Bottom" ErrorDisplayMode="ImageWithText" Display="Dynamic" SetFocusOnError="true">
                                        <RequiredField IsRequired="True" ErrorText="ingrese Contraseña" />
                                    </ValidationSettings>
                                </dx:ASPxTextBox>
                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                    
                    <dx:LayoutItem Name="SignIn" HorizontalAlign="Center" ShowCaption="False" Paddings-PaddingTop="20px">
                        <LayoutItemNestedControlCollection>
                            <dx:LayoutItemNestedControlContainer>

                                <dx:ASPxCallback ID="ASPxCallback1" runat="server" ClientInstanceName="Callback">
                                    <ClientSideEvents CallbackComplete="function(s, e) { LoadingPanel.Hide(); }" />
                                </dx:ASPxCallback>

                                <dx:ASPxButton ID="btnIngreso" runat="server" Text="Ingreso" Width="150" OnClick="btnIngreso_Click">
                                    <ClientSideEvents Click="function(s, e) {
                                                                Callback.PerformCallback();
                                                                LoadingPanel.Show();
                                                            }" />
                                    </dx:ASPxButton>

                                <dx:ASPxLoadingPanel ID="LoadingPanel" runat="server" ClientInstanceName="LoadingPanel"
                                    Modal="True">
                                </dx:ASPxLoadingPanel>

                                <dx:ASPxPopupControl ID="ASPxPopupControl1" HeaderText="Error Ingreso al Sistema" runat="server" ClientInstanceName="popupControl" Height="100px" Modal="True" CloseAction="CloseButton" Width="300px" AllowDragging="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter">
                                    <ContentCollection>
                                        <dx:PopupControlContentControl runat="server">
                                            Error: <dx:ASPxTextBox ID="txtPopup" runat="server" Width="295px" ClientInstanceName="txtPopup" ForeColor="#406a91" Font-Bold="true">
                                                        </dx:ASPxTextBox>
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

                            </dx:LayoutItemNestedControlContainer>
                        </LayoutItemNestedControlCollection>
                    </dx:LayoutItem>
                </Items>
            </dx:LayoutGroup>
        </Items>
    </dx:ASPxFormLayout>
        </div>

</asp:Content>
