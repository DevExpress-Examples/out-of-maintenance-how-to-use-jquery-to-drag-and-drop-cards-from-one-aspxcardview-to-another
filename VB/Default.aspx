<%@ Page Language="vb" AutoEventWireup="true" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<%@ Register Assembly="DevExpress.Web.v16.2, Version=16.2.10.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        td
        {
            vertical-align: top;
        }
        .draggingStyle
        {
            background-color: lightblue;
        }
        .targetGrid
        {
            background-color: lightcoral;
        }
    </style>
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    <script type="text/javascript" src="https://code.jquery.com/ui/1.10.4/jquery-ui.min.js"></script>
    <script src="jquery.ui.touch-punch.min.js"></script>
    <script src="script.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <dx:ASPxCallbackPanel ID="cbPanel" runat="server" ClientInstanceName="cbPanel" OnCallback="cbPanel_Callback">
                <PanelCollection>
                    <dx:PanelContent runat="server">
                        <table>
                            <tr>
                                <td>
                                    <dx:ASPxCardView ID="GridFrom" ClientInstanceName="gridFrom" runat="server" AutoGenerateColumns="False" KeyFieldName="CategoryID" Width="500"
                                        OnHtmlCardPrepared="GridFrom_HtmlCardPrepared">
                                        <Columns>
                                            <dx:CardViewTextColumn FieldName="CategoryID" ReadOnly="True" VisibleIndex="0">
                                            </dx:CardViewTextColumn>
                                            <dx:CardViewTextColumn FieldName="CategoryName" VisibleIndex="1">
                                            </dx:CardViewTextColumn>
                                            <dx:CardViewTextColumn FieldName="Description" VisibleIndex="2">
                                            </dx:CardViewTextColumn>
                                        </Columns>
                                        <Styles>
                                            <Table CssClass="droppableLeft"></Table>
                                            <Card CssClass="draggableRow left"></Card>
                                        </Styles>
                                    </dx:ASPxCardView>
                                </td>
                                <td>
                                    <dx:ASPxCardView ID="GridTo" ClientInstanceName="gridTo" runat="server" Width="500" KeyFieldName="CategoryID"
                                        OnHtmlCardPrepared="GridTo_HtmlCardPrepared">
                                        <Columns>
                                            <dx:CardViewTextColumn FieldName="CategoryID" ReadOnly="True" VisibleIndex="0">
                                            </dx:CardViewTextColumn>
                                            <dx:CardViewTextColumn FieldName="CategoryName" VisibleIndex="1">
                                            </dx:CardViewTextColumn>
                                            <dx:CardViewTextColumn FieldName="Description" VisibleIndex="2">
                                            </dx:CardViewTextColumn>
                                        </Columns>
                                        <Styles>
                                            <Table CssClass="droppableRight"></Table>
                                            <Card CssClass="draggableRow right"></Card>
                                        </Styles>
                                    </dx:ASPxCardView>
                                </td>
                            </tr>
                        </table>

                    </dx:PanelContent>
                </PanelCollection>
            </dx:ASPxCallbackPanel>
            <dx:ASPxGlobalEvents ID="ge" runat="server">
                <ClientSideEvents ControlsInitialized="OnControlsInitialized" EndCallback="OnControlsInitialized" />
            </dx:ASPxGlobalEvents>
        </div>
    </form>
</body>
</html>